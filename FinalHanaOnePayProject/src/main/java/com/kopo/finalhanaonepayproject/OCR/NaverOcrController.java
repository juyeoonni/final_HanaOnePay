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
        File tempFile = new File("temp.png");
        try (OutputStream os = new FileOutputStream(tempFile)) {
            os.write(imageFile.getBytes());
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }

        Map<String, String> extractedData = ClovaOCRTemplate.extractText(tempFile.getAbsolutePath());
        System.out.println("Extracted Data: " + extractedData);
        tempFile.delete();
        return ResponseEntity.ok(extractedData);
    }

}
