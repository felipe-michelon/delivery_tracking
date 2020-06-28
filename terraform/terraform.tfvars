# Lambda
lambda_notification_request_update_handler="lambda_function.lambda_handler"
lambda_notification_request_update_filename="../infra/lambdas/update_notification_request/lambda.zip"
lambda_notification_request_update_runtime="ruby2.7"
lambda_notification_request_update_timeout="10"

lambda_remind_update_notification_requests_handler="lambda_function.lambda_handler"
lambda_remind_update_notification_requests_filename="../infra/lambdas/remind_update_notification_requests/lambda.zip"
lambda_remind_update_notification_requests_runtime="ruby2.7"
lambda_remind_update_notification_requests_timeout="10"

lambda_backend_url="https://delivery-tracking.herokuapp.com"

# SNS
sns_topic_name_notification_request_update="notification-request-update-topic"
