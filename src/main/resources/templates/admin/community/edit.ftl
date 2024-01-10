<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>${siteName!""}|地址管理-编辑地址</title>
<#include "../common/header.ftl"/>

</head>
  
<body>
<div class="lyear-layout-web">
  <div class="lyear-layout-container">
    <!--左侧导航-->
    <aside class="lyear-layout-sidebar">
      
      <!-- logo -->
      <div id="logo" class="sidebar-header">
        <a href="/system/index"><img src="/admin/images/logo-sidebar.png" title="${siteName!""}" alt="${siteName!""}" /></a>
      </div>
      <div class="lyear-layout-sidebar-scroll"> 
        <#include "../common/left-menu.ftl"/>
      </div>
      
    </aside>
    <!--End 左侧导航-->
    
    <#include "../common/header-menu.ftl"/>
    
     <!--页面主要内容-->
    <main class="lyear-layout-content">
      
      <div class="container-fluid">
        
        <div class="row">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-header"><h4>编辑地址</h4></div>
              <div class="card-body">
                <form id="user-add-form" class="row">
                    <input type="hidden" id="id" name="id" value="${community.id}"/>
                    <div class="input-group m-b-10">
                        <span class="input-group-addon">省份</span>
                        <input type="text" class="form-control required"
                               value="${community.province}" disabled/>
                    </div>
                    <div class="input-group m-b-10">
                        <span class="input-group-addon">城市</span>
                        <input type="text" class="form-control required"
                               value="${community.city}" disabled/>
                    </div>
                    <div class="input-group m-b-10">
                        <span class="input-group-addon">区</span>
                        <input type="text" class="form-control required"
                               value="${community.area}" disabled />
                    </div>

                  <div class="input-group m-b-10">
                    <span class="input-group-addon">街道/镇</span>
                    <input type="text" class="form-control required" id="street" name="street"
                           value="${community.street}" placeholder="请输入街道名或者镇名" tips="请输入街道名或者镇名" />
                  </div>
                    <div class="input-group m-b-10">
                        <span class="input-group-addon">具体地址/社区</span>
                        <input type="text" class="form-control required" id="name" name="name"
                               value="${community.name}" placeholder="请输入你的具体地址" tips="请输入你的具体地址" />
                    </div>
                  <div class="form-group col-md-12">
                    <button type="button" class="btn btn-primary ajax-post" id="add-form-submit-btn">确 定</button>
                    <button type="button" class="btn btn-default" onclick="javascript:history.back(-1);return false;">返 回</button>
                  </div>
                </form>
       
              </div>
            </div>
          </div>
          
        </div>
        
      </div>
      
    </main>
    <!--End 页面主要内容-->
  </div>
</div>
<#include "../common/footer.ftl"/>
<script type="text/javascript" src="/admin/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="/admin/js/main.min.js"></script>
<script src="/admin/Distpicker/js/distpicker.data.js"></script>
<script src="/admin/Distpicker/js/distpicker.js"></script>
<script src="/admin/Distpicker/js/main.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//提交按钮监听事件
	$("#add-form-submit-btn").click(function(){
		if(!checkForm("user-add-form")){
			return;
		}

		var data = $("#user-add-form").serialize();
		$.ajax({
			url:'edit',
			type:'POST',
			data:data,
			dataType:'json',
			success:function(data){
				if(data.code == 0){
					showSuccessMsg('编辑成功!',function(){
						window.location.href = 'list';
					})
				}else{
					showErrorMsg(data.msg);
				}
			},
			error:function(data){
				alert('网络错误!');
			}
		});
	});
	//监听上传图片按钮
	$("#add-pic-btn").click(function(){
		$("#select-file").click();
	});
});

</script>
</body>
</html>