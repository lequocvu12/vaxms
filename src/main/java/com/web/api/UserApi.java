package com.web.api;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.web.dto.*;
import com.web.entity.Authority;
import com.web.entity.User;
import com.web.exception.MessageException;
import com.web.jwt.JwtTokenProvider;
import com.web.repository.AuthorityRepository;
import com.web.repository.UserRepository;
import com.web.service.GoogleOAuth2Service;
import com.web.service.UserService;
import com.web.utils.Contains;
import com.web.utils.MailService;
import com.web.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;

@RestController
@RequestMapping("/api/user")
@CrossOrigin
public class UserApi {

    private final UserRepository userRepository;

    private final JwtTokenProvider jwtTokenProvider;

    private final UserUtils userUtils;

    private final MailService mailService;

    @Autowired
    private AuthorityRepository authorityRepository;

    @Autowired
    private UserService userService;

    public UserApi(UserRepository userRepository, JwtTokenProvider jwtTokenProvider, UserUtils userUtils, MailService mailService) {
        this.userRepository = userRepository;
        this.jwtTokenProvider = jwtTokenProvider;
        this.userUtils = userUtils;
        this.mailService = mailService;
    }

    @Autowired
    private GoogleOAuth2Service googleOAuth2Service;

    @PostMapping("/login/google")
    public ResponseEntity<?> loginWithGoogle(@RequestBody String credential) throws Exception {
        GoogleIdToken.Payload payload = googleOAuth2Service.verifyToken(credential);
        if(payload == null){
            throw new MessageException("Đăng nhập thất bại");
        }
        TokenDto tokenDto = userService.loginWithGoogle(payload);
        return new ResponseEntity(tokenDto, HttpStatus.OK);
    }

    @PostMapping("/login/email")
    public ResponseEntity<?> loginWithEmail(@RequestBody LoginDto loginDto) throws Exception {
        TokenDto tokenDto = userService.login(loginDto.getEmail(), loginDto.getPassword());
        return new ResponseEntity(tokenDto, HttpStatus.OK);
    }

    @PostMapping("/public/regis")
    public ResponseEntity<?> regisUser(@RequestBody UserRequest userRequest) {
        User result= userService.regisUser(userRequest);
        return new ResponseEntity(result, HttpStatus.OK);
    }

    @PostMapping("/public/active-account")
    public ResponseEntity<?> activeAccount(@RequestParam String email, @RequestParam String key) {
        userService.activeAccount(key, email);
        return new ResponseEntity<>("kích hoạt thành công", HttpStatus.OK);
    }

    @PostMapping("/public/send-request-forgot-password")
    public ResponseEntity<?> quenMatKhau(@RequestBody ForgotPasswordDto forgotPasswordDto){
        userService.guiYeuCauQuenMatKhau(forgotPasswordDto.getEmail(), forgotPasswordDto.getUrl());
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @PostMapping("/public/complete-forgot-password")
    public ResponseEntity<?> datLaiMatKhau(@RequestParam String email, @RequestParam String key,
                                           @RequestParam String password) {
        userService.xacNhanDatLaiMatKhau(email, password, key);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @PostMapping("/all/user-logged")
    public ResponseEntity<?> inforLogged()  {
        return new ResponseEntity<>(userUtils.getUserWithAuthority(),HttpStatus.OK);
    }

    @PostMapping("/all/update-infor")
    public void updateThongTin(@RequestBody UserUpdate userUpdate){
        userService.updateInfor(userUpdate);
    }

    @PostMapping("/all/change-password")
    public ResponseEntity<?> changePassword(@RequestBody PasswordDto passwordDto){
        userService.changePass(passwordDto.getOldPass(), passwordDto.getNewPass());
        return new ResponseEntity<>("Success", HttpStatus.OK);
    }

    @PostMapping("/admin/lockOrUnlockUser")
    public void activeOrUnactiveUser(@RequestParam("id") Long id){
        User user = userRepository.findById(id).get();
        if(user.getActived() == true){
            user.setActived(false);
            userRepository.save(user);
            return;
        }
        else{
            user.setActived(true);
            userRepository.save(user);
        }
    }

    @PostMapping("/admin/change-role")
    public void changeRole(@RequestParam("id") Long id, @RequestParam String role){
        User user = userRepository.findById(id).get();
        Authority authority = authorityRepository.findByName(role);
        user.setAuthorities(authority);
        userRepository.save(user);
    }


    @GetMapping("/admin/get-user-by-role")
    public ResponseEntity<?> getUserByRole(@RequestParam(value = "role", required = false) String role){
        List<User> users = userService.getUserByRole(role);
        return new ResponseEntity<>(users, HttpStatus.OK);
    }

    @DeleteMapping("/admin/delete")
    public ResponseEntity<?> delete(@RequestParam("id") Long id){
        try {
            userRepository.deleteById(id);
        }catch (Exception e){
            throw new MessageException("Tài khoản đã liên kết dữ liệu không thể xóa");
        }
        return new ResponseEntity<>(HttpStatus.OK);
    }


    @GetMapping("/admin/check-role-admin")
    public void checkRoleAdmin(){
        System.out.println("admin");
    }

    @GetMapping("/user/check-role-user")
    public void checkRoleUser(){
        System.out.println("user");
    }

    @GetMapping("/employee/check-role-employee")
    public void checkRoleEmp(){
        System.out.println("user");
    }

}
