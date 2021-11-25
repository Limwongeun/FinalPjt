package kr.or.ddit.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.command.FileSaveCommand;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.FileSaveVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.service.FileSaveService;
import kr.or.ddit.util.GetAttachesAsMultipartFiles;

@Controller
@RequestMapping("/filesave")
public class FileSaveController {

	@Autowired
	private FileSaveService fileSaveService;

	@Resource(name = "fileSaveUploadPath")
	private String fileSaveUploadPath;
	
	@RequestMapping("/getFileList")
	@ResponseBody
	public ResponseEntity<List<FileSaveVO>> selectFileSaveByPrjctSn(int prjct_sn) throws Exception{
		ResponseEntity<List<FileSaveVO>> entity=null;
		try {
					
			List<FileSaveVO> fileList = fileSaveService.selectFileSaveByPrjctSn(prjct_sn);
						
			entity  = new ResponseEntity<List<FileSaveVO>>(fileList,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<List<FileSaveVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return entity;
		
		
		
/*		List<AttachVO> attachList = pds.getAttachList();
		if (attachList != null) {
			for (AttachVO attach : attachList) {
				String fileName = attach.getFileName().split("\\$\\$")[1];
				attach.setFileName(fileName);
			}
		}*/
	}
	
	@RequestMapping(value="/moveNode",method=RequestMethod.POST)
	public ResponseEntity<HttpStatus> moveNode(int id, int parent) throws Exception{
		FileSaveVO fileSaveVO = new FileSaveVO();
		fileSaveVO.setFilesave_sn(id);
		fileSaveVO.setUpper_file_sn(parent);
		fileSaveService.updateNodeMove(fileSaveVO);
		HttpStatus status = HttpStatus.OK;
		ResponseEntity<HttpStatus> entity = new ResponseEntity<>(status);
		
		return entity;
		
		
	}
	
	@RequestMapping(value="/deleteNode",method=RequestMethod.POST)
	public ResponseEntity<HttpStatus> deleteNode(int id) throws Exception{
		FileSaveVO fileSaveVO = new FileSaveVO();
		fileSaveVO.setFilesave_sn(id);
		fileSaveService.deleteNode(fileSaveVO);
		HttpStatus status = HttpStatus.OK;
		ResponseEntity<HttpStatus> entity = new ResponseEntity<>(status);
		
		return entity;
	}
	
	
	@RequestMapping(value="/renameNode",method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<HttpStatus> renameNode(String text, int id) throws Exception{
		FileSaveVO fileSaveVO = new FileSaveVO();
		fileSaveVO.setFilesave_sn(id);
		fileSaveVO.setFilesave_nm(text);
		fileSaveService.renameNode(fileSaveVO);
		HttpStatus status = HttpStatus.OK;
		ResponseEntity<HttpStatus> entity = new ResponseEntity<>(status);
		
		return entity;
	}
	
	@RequestMapping(value="/createNode",method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> createNode(int parent, int prjct_sn, HttpSession session) throws Exception{
		ResponseEntity<String> entity = null;
		FileSaveVO fileSaveVO = new FileSaveVO();
		fileSaveVO.setPrjct_sn(prjct_sn);
		fileSaveVO.setUpper_file_sn(parent);
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String mber_sn = member.getMber_sn();
		fileSaveVO.setFilesave_crtr(mber_sn);
		fileSaveVO.setFilesave_nm("New Node");
		fileSaveService.createNode(fileSaveVO);
		
		int filesave_sn = fileSaveVO.getFilesave_sn();
		entity = new ResponseEntity<String>(String.valueOf(filesave_sn),HttpStatus.OK);
		
		return entity;
	}
	
	@RequestMapping(value="/getParent",method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> getParent(int prjct_sn) throws Exception{
		FileSaveVO parent = fileSaveService.getParent(prjct_sn);
		ResponseEntity<String> entity = null;
		int parent_sn = parent.getFilesave_sn();
		entity = new ResponseEntity<String>(String.valueOf(parent_sn),HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping(value="/getFile/{id}/{page}",method=RequestMethod.POST)
	public ResponseEntity<Map<String , Object>> getFile(@PathVariable("id")int id,@PathVariable("page")int page) throws Exception{
		ResponseEntity<Map<String , Object>> entity = null;
		SearchCriteria cri = new SearchCriteria();
		
		cri.setPage(page);
		
		try {
			Map<String , Object> dataMap =fileSaveService.getFileList(id,cri); 
//			List<FileSaveVO> file = (List<FileSaveVO>) dataMap.get("fileList");
//			for (FileSaveVO fileSaveVO : file) {
//				System.out.println(fileSaveVO.getFilesize());
//			}
			entity = new ResponseEntity<Map<String, Object>>(dataMap,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
	         entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
	         
		}
		
		return entity;
	}
	
	
/*	
	     @RequestMapping(value="/{bno}/{page}",method=RequestMethod.GET)
   public ResponseEntity<Map<String , Object>> replyList(@PathVariable("bno") int bno,
         @PathVariable("page")int page)throws Exception{
      
      ResponseEntity<Map<String, Object>> entity = null;
      SearchCriteria cri = new SearchCriteria();
      
      cri.setPage(page);
      
      try {
         Map<String, Object> dataMap = replyService.getReplyList(bno, cri);
         entity = new ResponseEntity<Map<String, Object>>(dataMap,HttpStatus.OK);
      } catch (SQLException e) {
         e.printStackTrace();
         entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
         
      }
      return entity;
   }
   */
	
	@RequestMapping(value = "/regist", method = RequestMethod.POST, 
		    produces = "text/plain;charset=utf-8")
	public String regist(FileSaveCommand fileReq,RedirectAttributes rttr,
					HttpServletRequest request, HttpSession session)	throws Exception {
		int prjct_sn = fileReq.getPrjct_sn();
		
		String url="redirect:/pmsproject/file?prjct_sn="+prjct_sn+"&from=regist";
		
		MemberVO member = (MemberVO)session.getAttribute("loginUser");
		
	    List<FileSaveVO> file = GetAttachesAsMultipartFiles.save(fileReq, fileSaveUploadPath, member);
	    for (FileSaveVO fileSaveVO : file) {
			
	    	fileSaveService.fileUpload(fileSaveVO);
		}
		//pds.setTitle(HTMLInputFilter.htmlSpecialChars(pds.getTitle()));	
	    
		
		
	/*	pds.setTitle((String)request.getAttribute("XSStitle"));
		pds.setAttachList(attachList);
		
		service.regist(pds);
		
		rttr.addFlashAttribute("from","regist");		*/
		return url;
	}
	
	@RequestMapping("/getFile")
	public String getFile(int filesave_sn,Model model) throws Exception {
		
		String url="downloadFile";
		
		FileSaveVO file = fileSaveService.selectFileByFileSn(filesave_sn);
		
		
		model.addAttribute("savedPath",file.getFilesave_pth());
		model.addAttribute("fileName",file.getFilesave_nm());

		return url;
	}
	
//	@RequestMapping("/getFile")
//	public String getFile(HttpServletRequest request,Model model) throws Exception {
//		String url="downloadFile";	
//		String[] list = request.getParameterValues("checkFile");
//		List<FileSaveVO> fileList = new ArrayList<FileSaveVO>(); 
//		for (String string : list) {
//			int filesave_sn = Integer.parseInt(string);
//			FileSaveVO file = fileSaveService.selectFileByFileSn(filesave_sn);
//			fileList.add(file);
//		}
//	
//		model.addAttribute("fileList",fileList);
//		
//		return url;
//	}
	
//	@RequestMapping("/getFile")
//	public String getFile(HttpServletRequest request,Model model) throws Exception {
//		String url="downloadFile";	
//		String[] list = request.getParameterValues("checkFile");
//		List<FileSaveVO> fileList = new ArrayList<FileSaveVO>(); 
//		for (String string : list) {
//			int filesave_sn = Integer.parseInt(string);
//			FileSaveVO file = fileSaveService.selectFileByFileSn(filesave_sn);
//			fileList.add(file);
//		}
//	
//		model.addAttribute("fileList",fileList);
//		
//		return url;
//	}
	              
	
	@RequestMapping(value="/getName",method=RequestMethod.POST, produces = "application/json; charset=utf8")
	@ResponseBody
	public ResponseEntity<String> getName(int filesave_sn) throws Exception{
		String name = fileSaveService.selectParentByFileSn(filesave_sn);
		System.out.println(name);
		ResponseEntity<String> entity = null;
		entity = new ResponseEntity<String>(name,HttpStatus.OK);
		return entity;
	}
	@RequestMapping(value="/getCrtr",method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> getCrtr(@RequestBody List<String> check, HttpSession session) throws Exception{
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String mber = member.getMber_sn();
		int i = 1;
		if (check.size()==0) {
			i=0;
		}else {
			for (String string : check) {
				FileSaveVO file = fileSaveService.selectFileByFileSn(Integer.parseInt(string));
				String crtr = file.getFilesave_crtr();
				if (mber.equals(crtr)) {
					i=i*1;
				}else {
					i=i*0;
				}
				
			}
		}
		
		String delete = "";
		if (i==0) {
			delete = "no";
		}else if(i==1){
			delete = "ok";			
		}
		
		ResponseEntity<String> entity = null;
		entity = new ResponseEntity<String>(delete,HttpStatus.OK);
		return entity;
	}
	
/*	@RequestMapping("/getFileList")
	@ResponseBody
	public ResponseEntity<List<FileSaveVO>> fileAuthor(int prjct_sn) throws Exception{
		ResponseEntity<List<FileSaveVO>> entity=null;
		try {
					
			List<FileSaveVO> fileList = fileSaveService.selectFileSaveByPrjctSn(prjct_sn);
						
			entity  = new ResponseEntity<List<FileSaveVO>>(fileList,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<List<FileSaveVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}

		return entity;
		
	}*/
	   @RequestMapping("/fileAuthor")
	   public ModelAndView icon1(ModelAndView mnv, int prjct_sn)throws SQLException{
	      String url="file/fileAuthor";      
	      List<FileSaveVO> fileList = fileSaveService.selectFileSaveByPrjctSn(prjct_sn);
	      mnv.addObject("fileList2",fileList);
	      mnv.setViewName(url);
	      
	      return mnv;
	   }
	  	   
		@RequestMapping(value="/changeAuthor",method=RequestMethod.POST)
		public ResponseEntity<HttpStatus> changeAuthor(int filesave_sn, String option) throws Exception{
			
			FileSaveVO fileSaveVO = new FileSaveVO();
			fileSaveVO.setFilesave_sn(filesave_sn);
			fileSaveVO.setFilesave_author_code(option);
			fileSaveService.updateAuthor(fileSaveVO);
			
			HttpStatus status = HttpStatus.OK;
			ResponseEntity<HttpStatus> entity = new ResponseEntity<>(status);
			
			return entity;
		}
}
