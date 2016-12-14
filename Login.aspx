<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="THFinance.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>THFinance</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style type="text/css">


body { 
	background-image: url(images/bulding-bg.JPG);
	background-position: center center;
	background-repeat:  no-repeat;
	background-attachment: fixed;
	background-size:  cover;
	background-color: #999; 
}



#footerbottom {
    position: fixed;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 26px;
    background-color: #2c7ad2;
	margin:0;
	padding:0;
}


#footertext {
        margin: 0;
        padding: 0 0 0 20px;
        line-height: 26px;
        color: #ffffff;
        text-align: center;
		font-size:11px;
}
	
	
	#home{
		width:100%;
        height:100px;
        /*background-color:#EE6730;*/
	}
	#form-bg{
		
		width:100%;
		background:url(images/round-bg-n.PNG);
		height:251px;
		
		background-position: center center;
	background-repeat:  no-repeat;
    
     
		
		}
		@media screen and (max-width:767px)
		{
		#form-bg{
		
		width:100%;
		background:url(images/tab-bg-n.PNG);
		height:391px;
		margin-top:-60px;
        background-repeat:no-repeat;
        background-position: center center;
		

		
		}
        .memberlogin
{
	
	font-family:WelcomeFont;
	font-size:18px;
	color:#2b79d1;
	position: relative;
	font-weight:bold;

	
}
        .margin-form
        {
            margin-top:115px !important;
            width:280px;
        }
		}
		.form-group {
    margin-bottom: 5px;
}
  .margin-form
        {
            margin-top:10px ;
           
        }
@font-face {
    font-family:WelcomeFont;
    src: url(fonts/Geo703m.woff);
}

.welcomefont
{
	font-family:WelcomeFont;
	font-size:27px;
	color:#2b79d1;
	
	margin-left: 40px;
	padding-top:10px;
	letter-spacing:-0.5px;
	font-weight:bold;
	
	
}


.memberlogin
{
	
	font-family:WelcomeFont;
	font-size:21px;
	color:#2b79d1;
	position: relative;
	font-weight:bold;
	

	
}

#textboxshadow

{
box-shadow: inset -6px 0px 50px 0px #ABABAB,6px 5px 8px -5px #242424;
-webkit-box-shadow: inset -6px 0px 50px 0px #ABABAB,6px 5px 8px -5px #242424;
-moz-box-shadow: inset -6px 0px 50px 0px #ABABAB,6px 5px 8px -5px #242424;
-o-box-shadow: inset -6px 0px 50px 0px #ABABAB,6px 5px 8px -5px #242424;
	
}

@media screen and (max-width:1200px)
{
.memberlogin
{
	
	font-family:WelcomeFont;
	font-size:18px;
	color:#2b79d1;
	position: relative;
	font-weight:bold;
	
	
}

}
@media screen and (max-width:992px)
{
.img-width{
    position:relative; margin-top:-95px; margin-right:-43px !important;
}
.welcomefont
{
	font-family:WelcomeFont;
	font-size:24px;
	color:#2b79d1;
	padding-left:0px;
	
	padding-top:-10px;
	letter-spacing:-0.5px;
	font-weight:bold;
    position:relative;
    top:-30px;
	
	
}
}
.btn-width{
    padding:5px 15px; border-radius:0px;float:left; font-size:12px;
}
.img-width{
    position:relative; margin-top:-95px;
}
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="home">
    
    </div>
        <div class="container-fluid">
        <div class="col-lg-12">
<h1 class="welcomefont">Welcome to the <br>
THFinance
</h1>
</div>
</div>
        <div id="form-bg">
<div class="container">


   

<div class="row">
    <div class="col-md-4 col-sm-4 col-xs-12"></div>
    <div class="col-md-5 col-sm-4 col-xs-12">

        <%--<img src="images/mid-round.png" class="pull-right img-width hidden-xs"  />--%>
    </div>
<div class="col-md-3 col-sm-4  col-xs-12 " >
   
    
 <div class="margin-form center-block">
 <div class="memberlogin text-center"><p>MEMBER LOGIN</p></div>
                    <fieldset>
			    	  	<div  class="form-group">
			    		    <input class="form-control" placeholder="E-mail" name="email" type="text" runat="server"  id="txt_userloginemail">
                              
			    		</div>
			    		<%--<div  class="form-group">
			    			<input class="form-control" placeholder="Password" name="password" type="password" value="" runat="server">
			    		</div>--%>
                        <div class="form-group">
			    			<input class="form-control" placeholder="Password" name="password" type="password" value="" runat="server" id="txt_userloginpassword">
			    		</div>
                        
                        <div class="form-group" style="margin-top:10px;">
                            <div class="row"  > 
                                <div class="col-md-4 col-sm-5">
                                     <asp:Button CssClass="btn btn-sm btn-success btn-width" ID="btn_submit" runat="server" Text="Login" OnClick="btn_submit_Click" />
                                    
                                  </div>
                                <div class="col-md-8 col-sm-7">
                                    <a href="#" class="pull-right " style="color:rgba(0,0,0,0.5); font-weight:bold; font-size:12px;"  data-toggle="modal" data-target="#myModal">
                                        Forgot password?
                                    </a>
                                    </div>
                                    
                             
                            </div>

                        <div class="form-group" style="margin-top:10px;">
                           
                                        <a href="#" class="btn btn-lg btn-danger btn-block btn-width" data-toggle="modal" data-target="#myModal2">Signup </a>
                                  
                        </div>
                            
			    		</div>
			    		
			    		
			    	</fieldset>
			      	</div>

</div>
</div>
</div>
</div>


        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body" style="margin-bottom:20px;">
        <div  class="form-group">
			    		    <input class="form-control" placeholder="E-mail" name="email" type="text" runat="server">
                              
			    		</div>

           <div class="form-group">

               <asp:Button CssClass="btn btn-success  pull-left btn-width"  Text="Submit" runat="server" ID="btn_forgot" OnClick="btn_forgot_Click" />

			    
			    		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

        <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title" id="myModalLabel2">Registration</h4>
      </div>
      <div class="modal-body" style="margin-bottom:20px;">
        
          <div  class="form-group">
			    		    <input class="form-control" placeholder="UserName" name="text" type="text" runat="server" id="txt_UserName" >
                                  <asp:RequiredFieldValidator ID="rfv_txt_UserName" runat="server" ControlToValidate="txt_UserName"
                    meta:resourcekey="txt_barrowername" ErrorMessage="Please Select Borrower Name" Text="*" ForeColor="Red"
                    ValidationGroup="Controls"></asp:RequiredFieldValidator>
			    		</div>
          <div  class="form-group">
			    		    <input class="form-control" placeholder="Email" name="email" type="email" runat="server" id="txt_UserEmail" >
                              <asp:RequiredFieldValidator ID="rfv_txt_UserEmail" runat="server" ControlToValidate="txt_UserEmail"
                    meta:resourcekey="txt_barrowername" ErrorMessage="Please Select Borrower Name" Text="*" ForeColor="Red"
                    ValidationGroup="Controls"></asp:RequiredFieldValidator> 
			    		</div>
          <div  class="form-group">
			    		    <input class="form-control" placeholder="Password" name="text" type="password" runat="server" id="txt_UserPassword" >
                               <asp:RequiredFieldValidator ID="rfv_txt_UserPassword" runat="server" ControlToValidate="txt_UserPassword"
                    meta:resourcekey="txt_barrowername" ErrorMessage="Please Select Borrower Name" Text="*" ForeColor="Red"
                    ValidationGroup="Controls"></asp:RequiredFieldValidator> 
			    		</div>
           <div  class="form-group">
			    		    <input class="form-control" placeholder="professional" name="text" type="text" runat="server" id="txt_UserProfessional" >
                               <asp:RequiredFieldValidator ID="rfv_txt_UserProfessional" runat="server" ControlToValidate="txt_UserProfessional"
                    meta:resourcekey="txt_barrowername" ErrorMessage="Please Select Borrower Name" Text="*" ForeColor="Red"
                    ValidationGroup="Controls"></asp:RequiredFieldValidator> 
			    		</div>
           <div  class="form-group">
			    		    <input class="form-control"  name="text" type="file" runat="server" id="txt_uploadimage" >
                <asp:RequiredFieldValidator ID="rfv_txt_uploadimage" runat="server" ControlToValidate="txt_uploadimage"
                    meta:resourcekey="txt_barrowername" ErrorMessage="Please Select Borrower Name" Text="*" ForeColor="Red"
                    ValidationGroup="Controls"></asp:RequiredFieldValidator> 
                              <asp:RegularExpressionValidator ID="ref_txt_uploadimage" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg|.gif)$"
    ControlToValidate="txt_uploadimage" runat="server" ForeColor="Red" ErrorMessage="Please select a valid image or PDF File file." Text="*"
    Display="Dynamic" ValidationGroup="Controls" />
			    		</div>

           <div class="form-group">

               <asp:Button CssClass="btn btn-success  pull-left btn-width"  Text="Submit" runat="server" ID="btn_signup" OnClick="btn_signup_Click" ValidationGroup="Controls" />

			    
			    		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
    </form>
</body>
</html>
