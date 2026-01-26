package kr.co.viva.pay;

import java.io.File;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

public class QrCodeCreate {
	public static String createQR(int payNum, String realPath) {
        // 저장될 파일명 (예: qr_결제번호.png)
        String fileName = "qr_" + payNum + ".png";
        // 실제 서버 내 저장 경로
        String filePath = realPath + File.separator + fileName;
        String payNumStr = String.valueOf(payNum);
        try {
            File file = new File(realPath);
            if (!file.exists()) file.mkdirs(); // 폴더 없으면 생성

            QRCodeWriter qrCodeWriter = new QRCodeWriter();
            // 결제번호(payNum)를 담은 QR 코드 생성
            BitMatrix bitMatrix = qrCodeWriter.encode(payNumStr, BarcodeFormat.QR_CODE, 200, 200);

            Path path = FileSystems.getDefault().getPath(filePath);
            MatrixToImageWriter.writeToPath(bitMatrix, "PNG", path);
            
            return fileName; // DB에는 파일 이름만 저장
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
