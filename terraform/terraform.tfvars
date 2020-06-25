# Lambda
lambda_notification_request_update_name="update-notification-request"
lambda_notification_request_update_handler="lambda_function.lambda_handler"
lambda_notification_request_update_filename="../infra/lambdas/update_notification_request/lambda.zip"
lambda_notification_request_update_runtime="ruby2.7"
lambda_notification_request_update_timeout="10"
lambda_backend_url="https://delivery-tracking.herokuapp.com"

# SNS
sns_topic_name_notification_request_creation="notification-request-creation-topic"
sns_topic_name_notification_request_update="notification-request-update-topic"

# SQS
sqs_queue_name_notification_request_creation="notification-request-creation"
sqs_queue_name_notification_request_creation_deadletter="notification-request-creation-deadletter"
