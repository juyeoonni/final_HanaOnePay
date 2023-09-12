package com.kopo.finalhanaonepayproject.QR;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Base64;

@Controller
public class QrController {

    private QRCodeService qrCodeService;

    @Autowired
    public void QRCodeService(QRCodeService qrCodeService) {
        this.qrCodeService = qrCodeService;
    }

    @GetMapping("/QR/api/generateQRCode")
    public ResponseEntity<String> generateQRCode(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String productDataJSON = (String) session.getAttribute("productDataJSON");

        if (productDataJSON == null) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }

        try {
            byte[] qrCode = qrCodeService.generateQRCodeImage(productDataJSON);
            // byte[]를 Base64로 인코딩
            String base64Encoded = Base64.getEncoder().encodeToString(qrCode);
            return new ResponseEntity<>(base64Encoded, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

}
