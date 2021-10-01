# Section 3: System Design

Assumptions: 
- Company is in its early stages and would prefer fast deployment with as much serverless architecture as possible.
- Application is deployed only in Singapore, therefore no need for global availability as of yet (e.g. use of Cloudfront).
- Company wants to have increased availability.

## Requirements

Processing images 
- Storage solution must incorporate object storage.
- Storage solutions should be scalable to incorporate influx of images.
- S3 Storage should have lifecycle configuration to delete objects after 7 days.
- S3 storage be connected to a VPC Endpoint for Web Apps to fetch images.

Web application
- Load balanced by ALB for 2 availability zones.
- Processing should be done in private subnets, with a NAT gateway providing internet access to instances in case of updates.

Uploading Images
- API gateway signed url with lambda to process the image, then saved in S3.
- Image is processed and is stored in AWS S3.
- Metadata is stored in DynamoDB.
- Images will be auto deleted in amazon s3 lifecycle policy.
- AWS lambda can use existing code to process images.
- AWS Cognito can provide metadata and verify users.

Streaming Web Page 
- AWS managed Kafka for streaming.
- Hosted on load balanced instances.

Business intelligence
- AWS QuickSight to record and display business intelligence statistics.
- AWS DynamoDB to store metadata of files which can still be accessible even after objects are deleted.

![AWS architecture](https://github.com/BenFheng/dataeng_test/blob/50d88831d02c5ba6655430a62318efed7072f280/Section_3/AWS%20architecture.png)

## Steps for upload

1. POST event to initiate upload received by API Gateway
2. Verify token with Cognito User Pool
3. Token verified OK
4. Validate metadata and generate signed URL, send to API gateway
5. Send signed URL to user
6. PUT signed URL file
7. ObjectAdded event sent to lambda
8. Lambda processes images using company code and puts back into S3
9. Store event photo URL + metadata
10. Amazon QuickSight receives bucket data (possible to retrieve from DynamoDB) and displays information to company employees

