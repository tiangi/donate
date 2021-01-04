package com.donate.sys.controller;


import com.donate.common.RestfulApiResponse;
import com.donate.controller.BaseController;
import com.donate.sys.entity.User;
import com.donate.sys.service.IUserService;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.UUID;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author Leo
 * @since 2020-12-30
 */
@RestController
@RequestMapping("/file")
public class FileController extends BaseController {

    @Value("${spring.file.path}")
    private String filePath;

    @PostMapping(value = "/upload")
    public RestfulApiResponse<String> fileUpload(@RequestParam(value = "file") MultipartFile file, Model model, HttpServletRequest request) {
        if (file.isEmpty()) {
            return RestfulApiResponse.buildFailResponse("401", "文件空");
        }
        String fileName = file.getOriginalFilename();  // 文件名
        String suffixName = fileName.substring(fileName.lastIndexOf("."));  // 后缀名
        fileName = UUID.randomUUID() + suffixName; // 新文件名
        File dest = new File(filePath, fileName);
        if (!dest.getParentFile().exists()) {
            dest.getParentFile().mkdirs();
        }
        try {
            file.transferTo(dest);
        } catch (Exception e) {
            logger.error("", e);
        }
        String filename = "/upload/" + fileName;
        return RestfulApiResponse.buildSuccessResponse(filename);
    }
}
