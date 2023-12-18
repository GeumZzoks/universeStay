package com.universestay.project.common.S3;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.PutObjectResult;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


@Service
@PropertySource("classpath:config/env.properties")
public class AwsS3ImgUploaderService {

    @Autowired
    private final AmazonS3 amazonS3;

    public AwsS3ImgUploaderService(AmazonS3 amazonS3,
            String bucketName) {
        this.amazonS3 = amazonS3;
        this.bucketName = bucketName;
    }

    @Value("${cloud.aws.s3.bucket}")
    private String bucketName; //버킷 이름

    /**
     * @param img
     * @param folderName
     * @return S3Url
     * @feat : S3 이미지 서버에 이미지를 업로드시켜주는 메소드
     */
    public String uploadImageToS3(MultipartFile img, String folderName)
            throws Exception { //이미지를 S3에 업로드하고 이미지의 url을 반환
        String originName = img.getOriginalFilename(); //원본 이미지 이름

        String ext = originName.substring(originName.lastIndexOf(".")); //확장자
        String changedName = folderName + "/" + generateFileName(img.getOriginalFilename());
        //새로 생성된 이미지 이름
        ObjectMetadata metadata = new ObjectMetadata(); //메타데이터
        metadata.setContentType("image/" + ext);
        try {
            PutObjectResult putObjectResult = amazonS3.putObject(new PutObjectRequest(
                    bucketName, changedName, img.getInputStream(), metadata
            ).withCannedAcl(CannedAccessControlList.PublicRead));

        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception(); //예외던짐
        }
        return amazonS3.getUrl(bucketName, changedName)
                .toString(); //데이터베이스에 저장할 이미지가 저장된 주소
    }


    /**
     * @param originalName
     * @return fileName
     * @feat : 업로드한 시간을 앞에 붙여서 고유한 파일 이름을 만드는 메소드 (겹치지 않도록)
     */
    public static String generateFileName(String originalName) {
        Timestamp currentTime = new Timestamp(System.currentTimeMillis());

        // 현재 시간을 형식화하여 공백과 콜론 제거
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        String currentTimeString = sdf.format(currentTime);

        // 특수 문자와 공백을 제거하고 유효한 파일명으로 변환
        String savedName = currentTimeString + "_" + originalName.replaceAll("[^a-zA-Z0-9.-]", "_");
        return savedName;
    }

}
