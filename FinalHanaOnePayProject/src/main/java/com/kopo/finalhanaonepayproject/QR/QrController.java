package com.kopo.finalhanaonepayproject.QR;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.URLDecoder;
import java.util.Base64;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

@Controller
public class QrController {

    private QRCodeService qrCodeService;

    @Autowired
    public void QRCodeService(QRCodeService qrCodeService) {
        this.qrCodeService = qrCodeService;
    }

//    @GetMapping("/QR/api/generateQRCode")
//    public ResponseEntity<String> generateQRCode(HttpServletRequest request) {
//        HttpSession session = request.getSession();
//        String productDataJSON = (String) session.getAttribute("productDataJSON");
//
//        // JSON 문자열을 파싱하여 productName 값을 가져옵니다.
//        JSONObject json = new JSONObject(productDataJSON);
//        String encodedProductName = json.getString("productName");
//
//        // productName 값을 디코딩합니다.
//        String decodedProductName = URLDecoder.decode(encodedProductName, "UTF-8");
//
//        // 디코딩된 productName을 다시 JSON 객체에 설정합니다.
//        json.put("productName", decodedProductName);
//        productDataJSON = json.toString();
//
//        if (productDataJSON == null) {
//            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
//        }
//
//        try {
//            byte[] qrCode = qrCodeService.generateQRCodeImage(productDataJSON);
//            // byte[]를 Base64로 인코딩
//            String base64Encoded = Base64.getEncoder().encodeToString(qrCode);
//            return new ResponseEntity<>(base64Encoded, HttpStatus.OK);
//        } catch (Exception e) {
//            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//        }
//    }
@GetMapping("/QR/api/generateQRCode")
public ResponseEntity<String> generateQRCode(HttpServletRequest request) {
    HttpSession session = request.getSession();
    String encodedProductDataJSON = (String) session.getAttribute("productDataJSON");

    if (encodedProductDataJSON == null) {
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

    try {
        String decodedProductDataJSON = URLDecoder.decode(encodedProductDataJSON, "UTF-8");

        ObjectMapper objectMapper = new ObjectMapper();
        ObjectNode productData = (ObjectNode) objectMapper.readTree(decodedProductDataJSON);

        System.out.println("Decoded JSON: " + productData.toString());

        String decodedProductName = productData.get("productName").asText();
        productData.put("productName", decodedProductName);

        byte[] qrCode = qrCodeService.generateQRCodeImage(productData.toString());

        String base64Encoded = Base64.getEncoder().encodeToString(qrCode);
        return new ResponseEntity<>(base64Encoded, HttpStatus.OK);
    } catch (Exception e) {
        return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
}

}
