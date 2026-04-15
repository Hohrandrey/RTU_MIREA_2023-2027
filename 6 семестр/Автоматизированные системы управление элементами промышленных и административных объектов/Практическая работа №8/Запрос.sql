WITH category_stats AS (
    SELECT
        cat.id AS category_id,
        cat.name AS category_name,
        COALESCE(SUM(c.view_count), 0) AS total_views,
        COALESCE(AVG(c.avg_rating), 0) AS avg_rating,
        COUNT(DISTINCT c.id) AS content_count,
        COUNT(DISTINCT r.id) AS review_count,
        COUNT(DISTINCT r.user_id) AS unique_reviewers
    FROM categories cat
    LEFT JOIN content_categories cc ON cat.id = cc.category_id
    LEFT JOIN content c ON cc.content_id = c.id
    LEFT JOIN reviews r ON c.id = r.content_id AND r.moderation_status = 'approved'
    GROUP BY cat.id, cat.name
),
purchase_stats AS (
    SELECT
        cat.id AS category_id,
        COUNT(DISTINCT pr.id) AS purchase_request_count,
        SUM(pr.budget) AS total_budget_requested
    FROM categories cat
    LEFT JOIN content_categories cc ON cat.id = cc.category_id
    LEFT JOIN content c ON cc.content_id = c.id
    LEFT JOIN purchase_requests pr ON pr.content_id = c.id AND pr.status = 'approved'
    GROUP BY cat.id
)
SELECT
    cs.category_name,
    cs.total_views,
    cs.avg_rating,
    cs.content_count,
    cs.review_count,
    cs.unique_reviewers,
    COALESCE(ps.purchase_request_count, 0) AS approved_purchase_requests,
    COALESCE(ps.total_budget_requested, 0) AS total_approved_budget
FROM category_stats cs
LEFT JOIN purchase_stats ps ON cs.category_id = ps.category_id
ORDER BY cs.total_views DESC
LIMIT 5;
