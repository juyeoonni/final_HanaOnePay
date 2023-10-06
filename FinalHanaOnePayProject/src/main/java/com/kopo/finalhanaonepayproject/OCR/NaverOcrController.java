package com.kopo.finalhanaonepayproject.OCR;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Map;

@RestController
public class NaverOcrController {
    @PostMapping("/authenticateAction")
    public ResponseEntity<Map<String, String>> authenticate(@RequestParam("image") MultipartFile imageFile) {
        // 업로드된 파일을 임시 파일에 저장
        File tempFile = new File("temp.png");
        try (OutputStream os = new FileOutputStream(tempFile)) {
            os.write(imageFile.getBytes());
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }

        // Clova OCR API 호출하여 response get
        Map<String, String> extractedData = ClovaOCRTemplate.extractText(tempFile.getAbsolutePath());
        System.out.println("Extracted Data: " + extractedData);
        // Delete the temporary file
        tempFile.delete();

        return ResponseEntity.ok(extractedData);
    }

}
