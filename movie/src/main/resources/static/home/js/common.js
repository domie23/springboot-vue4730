//显示成功信息
function showSuccessMsg(msg,callback){
	$.confirm({
        title: '成功',
        content: msg,
        type: 'green',
        typeAnimated: false,
        buttons: {
            omg: {
                text: '确定！',
                btnClass: 'btn-green',
                action: function(){
                	callback();
        		}
            }
        }
    });
}
//显示错误信息
function showErrorMsg(msg){
	$.confirm({
        title: '错误',
        content: msg,
        type: 'red',
        typeAnimated: false,
        buttons: {
            omg: {
                text: '知道了！',
                btnClass: 'btn-red',
                action: function(){
                	
        		}
            }
        }
    });
}
//显示警告信息
function showWarningMsg(msg){
	$.confirm({
        title: '警告',
        content: msg,
        type: 'red',
        typeAnimated: false,
        buttons: {
            omg: {
                text: '知道了！',
                btnClass: 'btn-red',
                action: function(){
                	
        		}
            }
        }
    });
}
//表单验证公用方法，传表单form的id进来即可
function checkForm(formId){
	var flag = true;
	$("#"+formId).find(".required").each(function(i,e){
		if($(e).val() == ''){
			showWarningMsg($(e).attr('tips'));
			flag = false;
			return false;
		}
	});
	return flag;
}
//统一图片上传方法
function upload(showPictureImg,input){
	//formdata
	var formData = new FormData();
	formData.append('photo',document.getElementById('select-file').files[0]);
	$.ajax({
		url:'/upload/upload_photo',
		contentType:false,
		processData:false,
		data:formData,
		type:'POST',
		success:function(data){
				if(data.code == 0){
					showSuccessMsg('图片上传成功!',function(){
						$("#"+showPictureImg).attr('src','/photo/view?filename=' + data.data);
						$("#"+input).val(data.data);
					})
				}else{
					data = $.parseJSON(data);
					showErrorMsg(data.msg);
				}
			},
			error:function(data){
				alert('网络错误!');
			}
	});
}
function uploadPhoto(photo,callback){
	//formdata
	var formData = new FormData();
	formData.append('photo',photo);
	$.ajax({
		url:'/upload/upload_photo',
		contentType:false,
		processData:false,
		data:formData,
		type:'POST',
		success:function(data){
			if(data.code == 0){
				callback(data);
			}else{
				//data = $.parseJSON(data);
				showErrorMsg(data.msg);
			}
		},
		error:function(data){
			alert('网络错误!');
		}
	});
}
function uploadVideoToServer(video,callback){
	//formdata
	var formData = new FormData();
	formData.append('video',video);
	$.ajax({
		url:'/upload/upload_video',
		contentType:false,
		processData:false,
		data:formData,
		type:'POST',
		success:function(data){
			if(data.code == 0){
				callback(data);
			}else{
				//data = $.parseJSON(data);
				showErrorMsg(data.msg);
			}
		},
		error:function(data){
			alert('网络错误!');
		}
	});
}
//统一ajax请求
function ajaxRequest(url,requestType,data,callback){
	$.ajax({
		url:url,
		type:requestType,
		data:data,
		dataType:'json',
		success:function(rst){
			if(rst.code == 0){
				callback(rst);
			}else{
				alert(rst.msg);
			}
		},
		error:function(data){
			alert('网络错误!');
		}
	});
}
//统一ajax请求
function ajaxAsyncRequest(url,requestType,data,callback){
	$.ajax({
		url:url,
		type:requestType,
		data:data,
		dataType:'json',
		async:false, 
		success:function(rst){
			if(rst.code == 0){
				callback(rst);
			}else{
				alert(rst.msg);
			}
		},
		error:function(data){
			alert('网络错误!');
		}
	});
}