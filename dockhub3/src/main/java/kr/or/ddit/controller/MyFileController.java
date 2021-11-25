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
import kr.or.ddit.service.MyFileService;
import kr.or.ddit.util.GetAttachesAsMultipartFiles;

@Controller
@RequestMapping("/myFile")
public class MyFileController {
	
	@Autowired
	private MyFileService myfileService;
	
	@Autowired
	private FileSaveService fileSaveService;
	
	@Resource(name = "fileSaveUploadPath")
	private String fileSaveUploadPath;
	
	@RequestMapping("/getFile")
	public String getFile1(int filesave_sn,Model model) throws Exception {
		
		String url="downloadFile";
		
		FileSaveVO file = fileSaveService.selectFileByFileSn(filesave_sn);
		
		
		model.addAttribute("savedPath",file.getFilesave_pth());
		model.addAttribute("fileName",file.getFilesave_nm());

		return url;
	}
		
	   @RequestMapping("/icon")
	   public ModelAndView icon1(ModelAndView mnv)throws SQLException{
	      String url="icon/file_save";      

	      mnv.setViewName(url);
	      
	      return mnv;
	   }
	   
		@RequestMapping("/getFileList")
		@ResponseBody
		public ResponseEntity<List<FileSaveVO>> icon11(HttpSession session) throws Exception{
			ResponseEntity<List<FileSaveVO>> entity=null;
			try {
				MemberVO member = (MemberVO) session.getAttribute("loginUser");
				List<FileSaveVO> fileList = myfileService.selectIcon(member.getMber_sn());
							
				entity  = new ResponseEntity<List<FileSaveVO>>(fileList,HttpStatus.OK);
			} catch (Exception e) {
				entity = new ResponseEntity<List<FileSaveVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
				e.printStackTrace();
			}

			return entity;
			
		}
			
		@RequestMapping(value="/moveNode",method=RequestMethod.POST)
		public ResponseEntity<HttpStatus> moveNode1(int id, int parent) throws Exception{
			FileSaveVO fileSaveVO = new FileSaveVO();
			fileSaveVO.setFilesave_sn(id);
			fileSaveVO.setUpper_file_sn(parent);
			fileSaveService.updateNodeMove(fileSaveVO);
			HttpStatus status = HttpStatus.OK;
			ResponseEntity<HttpStatus> entity = new ResponseEntity<>(status);
			
			return entity;
				
		}
		
		@RequestMapping(value="/deleteNode",method=RequestMethod.POST)
		public ResponseEntity<HttpStatus> deleteNode1(int id) throws Exception{
			FileSaveVO fileSaveVO = new FileSaveVO();
			fileSaveVO.setFilesave_sn(id);
			fileSaveService.deleteNode(fileSaveVO);
			HttpStatus status = HttpStatus.OK;
			ResponseEntity<HttpStatus> entity = new ResponseEntity<>(status);
			
			return entity;
		}
		
		@RequestMapping(value="/renameNode",method=RequestMethod.POST)
		@ResponseBody
		public ResponseEntity<HttpStatus> renameNode1(String text, int id) throws Exception{
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
		public ResponseEntity<String> createNode1(int parent, int prjct_sn, HttpSession session) throws Exception{
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
		public ResponseEntity<String> getParent1(int prjct_sn) throws Exception{
			FileSaveVO parent = fileSaveService.getParent(prjct_sn);
			ResponseEntity<String> entity = null;
			int parent_sn = parent.getFilesave_sn();
			entity = new ResponseEntity<String>(String.valueOf(parent_sn),HttpStatus.OK);
			return entity;
		}
		
		@RequestMapping(value="/getFile/{id}/{page}",method=RequestMethod.POST)
		public ResponseEntity<Map<String , Object>> getFile1(@PathVariable("id")int id,@PathVariable("page")int page, HttpSession session) throws Exception{
			ResponseEntity<Map<String , Object>> entity = null;
			SearchCriteria cri = new SearchCriteria();
			MemberVO member = (MemberVO) session.getAttribute("loginUser");
			cri.setPage(page);
			cri.setPerPageNum(5);
			FileSaveVO file = new FileSaveVO();
			file.setUpper_file_sn(id);
			file.setMber_sn(member.getMber_sn());
			try {
				Map<String , Object> dataMap = myfileService.getFileList1(file, cri);
				entity = new ResponseEntity<Map<String, Object>>(dataMap,HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
		         entity = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		         
			}
			
			return entity;
		}
		

		@RequestMapping(value = "/regist", method = RequestMethod.POST, 
			    produces = "text/plain;charset=utf-8")
		public String regist1(FileSaveCommand fileReq,RedirectAttributes rttr,
						HttpServletRequest request, HttpSession session)	throws Exception {
			String url="redirect:/myFile/icon.do";
			
			MemberVO member = (MemberVO)session.getAttribute("loginUser");
			int fileSn = fileReq.getNodeId();
			int prjct_sn=myfileService.selectPrjctByFile(fileSn);
			fileReq.setPrjct_sn(prjct_sn);
		    List<FileSaveVO> file = GetAttachesAsMultipartFiles.save(fileReq, fileSaveUploadPath, member);
		    for (FileSaveVO fileSaveVO : file) {
		    	fileSaveService.fileUpload(fileSaveVO);
			}
			return url;
		}
		
		@RequestMapping(value="/getName",method=RequestMethod.POST, produces = "application/json; charset=utf8")
		@ResponseBody
		public ResponseEntity<String> getName1(int filesave_sn) throws Exception{
			String name = fileSaveService.selectParentByFileSn(filesave_sn);
			System.out.println(name);
			ResponseEntity<String> entity = null;
			entity = new ResponseEntity<String>(name,HttpStatus.OK);
			return entity;
		}
		@RequestMapping(value="/getCrtr",method=RequestMethod.POST)
		@ResponseBody
		public ResponseEntity<String> getCrtr1(@RequestBody List<String> check, HttpSession session) throws Exception{
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
		
		
}
