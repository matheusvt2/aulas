import json
import boto3
from datetime import datetime
import requests

def hello(event, context):
    now = datetime.now()
    current_time = now.strftime("%H:%M:%S %p")
    accountId = context.invoked_function_arn.split(':')[4] # Pegando o ARN que chamou a função para pegar o ACCOUNTID
    queueName = "fila-saida"
    
    r = requests.get("https://www.google.com.br")
    bodyData = json.dumps({"Time":current_time, "EventKeys": [x for x in event] ,  "EventValues":[event[x] for x in event],  "URLGet": r.url,  "StatusCode": r.status_code })
    
    sqs = boto3.client('sqs') # Crio cliente SQS
    sqs.send_message(
        QueueUrl=f"https://sqs.us-east-1.amazonaws.com/{accountId}/{queueName}",
        MessageBody=bodyData
    )  # Envio para a fila SQS
    return {
        'statusCode': 200,
        'body': bodyData
    }