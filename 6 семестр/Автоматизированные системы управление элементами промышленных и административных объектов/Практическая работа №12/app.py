import os
from flask import Flask, render_template, request, redirect, url_for, flash
import psycopg2
from psycopg2.extras import RealDictCursor

app = Flask(__name__)
app.secret_key = 'your-secret-key-here'

DB_HOST = os.environ.get('DB_HOST', '192.168.56.10')
DB_NAME = os.environ.get('DB_NAME', 'semantic_picker')
DB_USER = os.environ.get('DB_USER', 'student')
DB_PASSWORD = os.environ.get('DB_PASSWORD', 'student123')

def get_db_connection():
    conn = psycopg2.connect(
        host=DB_HOST,
        database=DB_NAME,
        user=DB_USER,
        password=DB_PASSWORD
    )
    conn.autocommit = False
    return conn

@app.route('/')
def index():
    return redirect(url_for('list_content'))

@app.route('/content')
def list_content():
    search = request.args.get('search', '').strip()
    conn = get_db_connection()
    cur = conn.cursor(cursor_factory=RealDictCursor)
    if search:
        cur.execute("""
            SELECT * FROM контент
            WHERE название ILIKE %s OR авторы ILIKE %s
            ORDER BY идентификатор
        """, (f'%{search}%', f'%{search}%'))
    else:
        cur.execute("SELECT * FROM контент ORDER BY идентификатор")
    content_list = cur.fetchall()
    cur.close()
    conn.close()
    return render_template('list.html', content=content_list, search=search)

@app.route('/content/add', methods=['GET', 'POST'])
def add_content():
    if request.method == 'POST':
        title = request.form['название']
        content_type = request.form['тип']
        author = request.form['авторы']
        description = request.form['описание']
        level = request.form['уровень']
        language = request.form['язык']

        conn = get_db_connection()
        cur = conn.cursor()
        try:
            cur.execute("""
                INSERT INTO контент (название, тип, авторы, описание, уровень, язык)
                VALUES (%s, %s, %s, %s, %s, %s)
            """, (title, content_type, author, description, level, language))
            conn.commit()
            flash('Контент успешно добавлен!', 'success')
        except Exception as e:
            conn.rollback()
            flash(f'Ошибка при добавлении: {str(e)}', 'danger')
        finally:
            cur.close()
            conn.close()
        return redirect(url_for('list_content'))
    return render_template('add.html')

@app.route('/content/edit/<int:id>', methods=['GET', 'POST'])
def edit_content(id):
    conn = get_db_connection()
    cur = conn.cursor(cursor_factory=RealDictCursor)
    if request.method == 'POST':
        title = request.form['название']
        content_type = request.form['тип']
        author = request.form['авторы']
        description = request.form['описание']
        level = request.form['уровень']
        language = request.form['язык']

        try:
            cur.execute("""
                UPDATE контент
                SET название=%s, тип=%s, авторы=%s, описание=%s, уровень=%s, язык=%s,
                    дата_обновления = CURRENT_TIMESTAMP
                WHERE идентификатор=%s
            """, (title, content_type, author, description, level, language, id))
            conn.commit()
            flash('Контент обновлён!', 'success')
        except Exception as e:
            conn.rollback()
            flash(f'Ошибка обновления: {str(e)}', 'danger')
        finally:
            cur.close()
            conn.close()
        return redirect(url_for('list_content'))

    cur.execute("SELECT * FROM контент WHERE идентификатор = %s", (id,))
    item = cur.fetchone()
    cur.close()
    conn.close()
    if item is None:
        flash('Контент не найден', 'warning')
        return redirect(url_for('list_content'))
    return render_template('edit.html', item=item)

@app.route('/content/delete/<int:id>', methods=['POST'])
def delete_content(id):
    conn = get_db_connection()
    cur = conn.cursor()
    try:
        cur.execute("DELETE FROM контент WHERE идентификатор = %s", (id,))
        conn.commit()
        flash('Контент удалён', 'info')
    except Exception as e:
        conn.rollback()
        flash(f'Ошибка удаления: {str(e)}', 'danger')
    finally:
        cur.close()
        conn.close()
    return redirect(url_for('list_content'))

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
