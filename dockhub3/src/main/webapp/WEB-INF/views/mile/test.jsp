<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.tab-wrapper {
  position: relative;
  height: 500px;
  clear: both;
  padding: 6px 15px 0;
  overflow: hidden;
}

.tab-item {
  float: left;
  
  [type="radio"] {
    display: none;
    
    &:checked ~ .tab-label {
      background: #fff;
      border-bottom: 1px solid #fff;
      color: #2a2b39;
      z-index: 55;
      
      & ~ .tab-content {
        z-index: 50;  
      }
    }
  }
}

.tab-label {
  display: flex;
  align-items: center;
  position: relative;
  left: 1px;
  bottom: 2px;
  height: 36px;
  padding-right: 24px;
  padding-left: 24px;
  background: #d9dbe6;
  border: 1px solid #caccdb;
  margin-left: 2px;
  border-top-left-radius: 2px;
  border-top-right-radius: 2px;
  font-weight: bold;
  cursor: pointer;
  font-size: 12px;
  color: #666;
}

.tab-content {
  position: absolute;
  top: 41px;
  right: 0;
  left: 0;
  bottom: 0;
  padding: 15px;
  background: #fff;
  border-top: 1px solid #caccdb;
  overflow: auto;
}
</style>
</head>
<body>
<div class="tab-wrapper">
  
  <div class="tab-item">
    <input type="radio" id="tab1" name="tabGroup">
    <label for="tab1" class="tab-label">Tab Menu 1</label>
    <div class="tab-content">
      This is first contents.
    </div>
  </div>
  
  <div class="tab-item">
    <input type="radio" id="tab2" name="tabGroup">
    <label for="tab2" class="tab-label">Tab Menu 2</label>
    <div class="tab-content">
      This is second contents.
    </div>
  </div>
 
  <div class="tab-item">
    <input type="radio" id="tab3" name="tabGroup">
    <label for="tab3" class="tab-label">Tab Menu 3</label>
    <div class="tab-content">
      This is third contents.
    </div>
  </div>
  
</div>
</body>
</html>