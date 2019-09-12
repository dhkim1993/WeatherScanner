package com.spring.weather.board.controller;

import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.weather.addfile.model.AddFileVO;
import com.spring.weather.addfile.service.IAddFileService;
import com.spring.weather.board.model.BoardVO;
import com.spring.weather.board.service.IBoardService;
import com.spring.weather.commons.paging.PageCreator;
import com.spring.weather.commons.paging.SearchCriteria;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/board")
public class BoardController {

    private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

    @Autowired
    private IBoardService service;
    @Autowired
    private IAddFileService fileservice;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(SearchCriteria cri, Model model) throws Exception {

        logger.info("/board/list : GET요청 발생!");

        PageCreator pc = new PageCreator();
        pc.setCriteria(cri);
        pc.setArticleTotalCount(service.countSearchArticles(cri));

        List<BoardVO> articles = service.listSearch(cri);
        model.addAttribute("articles", articles);
        model.addAttribute("pageCreator", pc);

        return "board/list";
    }

    @RequestMapping(value = "/write", method = RequestMethod.GET)
    public String write() {
        logger.info("method: get > /board/write");
        return "board/write";
    }

    @PostMapping("/write")
    public String write(BoardVO article, RedirectAttributes redirectAttr) throws Exception {

        logger.info("method: post > /board/write");
        logger.info(article.toString());

        MultipartFile mfile = article.getFile();
        if (mfile != null && !mfile.isEmpty()) {
            logger.info("파일업로드");
            AddFileVO file = new AddFileVO();
            file.setFileName(mfile.getOriginalFilename());
            file.setFileSize(mfile.getSize());
            file.setFileData(mfile.getBytes());
            file.setFileContentType(mfile.getContentType());
            logger.info("file info: " + file);
            service.insert(article, file);
        } else {
            service.insert(article);
        }
        redirectAttr.addFlashAttribute("message", "regSuccess");
        return "redirect:/board/list";
    }

    @RequestMapping(value = "/content", method = RequestMethod.GET)
    public String content(@RequestParam("boardNo") int boardNo,
                          @ModelAttribute("criteria") SearchCriteria cri,
                          Model model) throws Exception {

        logger.info("method: get > /board/content");
        BoardVO article = service.getArticle(boardNo, true);
        String c = article.getContent();
        c.replace("<br>", "");
        article.setContent(c);
        System.out.println(c);
        model.addAttribute("article", article);

        if (fileservice.countFile(boardNo) != 0) {
            model.addAttribute("files", "확인용데이터");
        }
        return "board/content";
    }

    @RequestMapping("/file/{boardNo}")
    public ResponseEntity<byte[]> getFile(@PathVariable int boardNo, Model model) throws Exception {

        AddFileVO file = fileservice.selectFile(boardNo);
        logger.info("file: " + file);
        HttpHeaders headers = new HttpHeaders();
        String[] ftypes = file.getFileContentType().split("/");
        headers.setContentType(new MediaType(ftypes[0], ftypes[1]));
        headers.setContentLength(file.getFileSize());
        headers.setContentDispositionFormData("attachment", file.getFileName());
        model.addAttribute("fileNo", file.getFileNo());

        return new ResponseEntity<byte[]>(file.getFileData(), headers, HttpStatus.OK);
    }


    @RequestMapping(value = "/modify", method = RequestMethod.GET)
    public String modify(@RequestParam("boardNo") int boardNo,
                         @ModelAttribute("criteria") SearchCriteria cri,
                         Model model) throws Exception {

        logger.info("method: get > /board/modify");
        model.addAttribute("article", service.getArticle(boardNo, false));
        if (fileservice.countFile(boardNo) != 0) {
            model.addAttribute("file", fileservice.selectFile(boardNo));
        }
        return "board/modify";
    }

    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modify(BoardVO article,
                         SearchCriteria cri,
                         RedirectAttributes redirectAttributes) throws Exception {

        logger.info("method: post > /board/modify");
        MultipartFile mfile = article.getFile();

        if (mfile != null && !mfile.isEmpty()) {
            logger.info("파일업로드");
            AddFileVO file = new AddFileVO();
            file.setFileName(mfile.getOriginalFilename());
            file.setFileSize(mfile.getSize());
            file.setFileData(mfile.getBytes());
            file.setFileContentType(mfile.getContentType());
            logger.info("file info: " + file);
            service.update(article, file);
        } else { service.update(article); }
        redirectAttributes.addAttribute("page", cri.getPage())
                    .addAttribute("countPerPage", cri.getCountPerPage())
                    .addAttribute("condition", cri.getCondition())
                    .addAttribute("keyword", cri.getKeyword())
                    .addFlashAttribute("message", "modSuccess");

        return "redirect:/board/list";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String remove(@RequestParam("boardNo") int boardNo,
                         SearchCriteria cri,
                         RedirectAttributes redirectAttributes) throws Exception {

        logger.info("method: post > /board/delete");

        service.delete(boardNo);

        redirectAttributes.addAttribute("page", cri.getPage())
                          .addAttribute("countPerPage", cri.getCountPerPage())
                          .addAttribute("condition", cri.getCondition())
                          .addAttribute("keyword", cri.getKeyword());
        redirectAttributes.addFlashAttribute("message", "delSuccess");

        return "redirect:/board/list";
    }

    @RequestMapping(value = "/reviewAd/{memberId}", method = RequestMethod.GET)
    public String reviewAd(@PathVariable String memberId, Model model) throws Exception {

        SearchCriteria cri = new SearchCriteria();

        cri.setCondition("member_id");
        cri.setKeyword(memberId);

        model.addAttribute("articles", service.listSearch(cri))
                .addAttribute("nickname", memberId);

        return "admin/review_admin";
    }

    @PostMapping("/deleteAd/{boardNo}")
    @ResponseBody
    public String deleteAdmin(@PathVariable int boardNo, RedirectAttributes redirect) throws Exception {
        System.out.println(boardNo);
        service.delete(boardNo);
        String message = "delSuccess";
        redirect.addFlashAttribute("message", message);

        return message;
    }
}
