<%@ Page Title="" Language="C#" MasterPageFile="~/THFinance.Master" AutoEventWireup="true" CodeBehind="NewPayee.aspx.cs" Inherits="THFinance.NewPayee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
         .form-wrap {
    width: 30%;
    margin: 0 auto;
}
    </style>
  
  <script>
      function datechange() {

          
          debugger;
          var s = document.getElementById("ContentPlaceHolder1_txt_startdate").value;
          var result = new Date(s);
          result.setDate(result.getDate() + 100);
         

          var dd = result.getDate();
          var mm = result.getMonth() + 1;
          var y = result.getFullYear();
          var someFormattedDate = mm + '/' + dd + '/' + y;
          document.getElementById("ContentPlaceHolder1_txt_enddate").value  = someFormattedDate;
          //document.getElementById("ContentPlaceHolder1_txt_enddate").disabled = true;
       
      }
      //jQuery('#txt_startdate').on('input', function () {
      //    alert();
      //    var s = $('#txt_startdate').val;
      //    $('#txt_enddate').val = s + 30;
      //});
      //$(document).ready(function () {
      //    $("#ContentPlaceHolder1_txt_startdate").change(function () {
      //        alert("The text has been changed.");
      //    });
      //})
  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <div class="form-wrap">
                <h1>New Payee</h1>
               
                        <div class="form-group">
                            <label  for="email" class=" control-label">Name</label>
                            <asp:TextBox ID="txt_name" runat="server" CssClass="form-control input-md" OnTextChanged="txt_name_TextChanged" AutoPostBack="true"  ></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="key" class=" control-label">Branch</label>
                           <asp:DropDownList ID="ddl_branch" runat="server" CssClass="form-control input-md" OnSelectedIndexChanged="ddl_branch_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        </div>
         <div class="form-group">
                            <label for="key" class=" control-label">Manager</label>
                           <asp:DropDownList ID="ddl_manager" runat="server" CssClass="form-control input-md"></asp:DropDownList>
                        </div>

          <div class="form-group">
                            <label for="key" class="control-label">Payment Method</label>
                           <asp:DropDownList ID="ddl_chitti" runat="server" CssClass="form-control input-md"></asp:DropDownList>
                        </div>
          <div class="form-group">
                            <label for="key" class=" control-label">Payee proof</label>
                              <input class="form-control"  name="text" type="file" runat="server" id="txt_payeeproof" >
                        </div>
          <div class="form-group">
                            <label for="email" class=" control-label">Nominee Name</label>
                            <asp:TextBox ID="txt_Nominee" runat="server" CssClass="form-control input-md"></asp:TextBox>
                        </div>
          <div class="form-group">
                            <label for="key" class=" control-label">Nominee proof</label>
                              <input class="form-control"  name="text" type="file" runat="server" id="txt_nomineeproof" >
                        </div>
          <div class="form-group">
                            <label for="key" class=" control-label">Amount</label>
              <asp:TextBox ID="txt_amount" runat="server" CssClass="form-control input-md" OnTextChanged="txt_amount_TextChanged" AutoPostBack="true"  ></asp:TextBox>
                             <%-- <input class="form-control"  name="text" type="number" runat="server" id="txt_amount" >--%>
                        </div>
         
          <div class="form-group">
                            <label for="key" class=" control-label">Given Amount</label>
                              <input class="form-control"  name="text" type="number" runat="server" id="txt_givenamount" >
                        </div>
          <div class="form-group">
                <div class='input-group date' id='datetimepicker1'>
      <%--<asp:TextBox ID="txt_startdate" runat="server" CssClass="form-control input-md" OnTextChanged="txt_startdate_TextChanged" AutoPostBack="true"  ></asp:TextBox>--%>
               
                  <input type='text' class="form-control" runat="server" ID="txt_startdate"  />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
                 
       </div>
          <div class="form-group">
              <label  for="email" class=" control-label">Name</label>
                <input type='text' class="form-control" runat="server" ID="txt_enddate"  onfocus="datechange()" />
                          <%--  <asp:TextBox ID="txt_enddate" runat="server" CssClass="form-control input-md"    AutoPostBack="true"  ></asp:TextBox>--%>
                <%--<div class='input-group date' id='datetimepicker2'>
                    <input type='text' class="form-control" runat="server" id="txt_enddate" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>--%>

              </div>
          <div class="form-group">

  
      <asp:Button ID="btn_newpayee" runat="server"  CssClass="btn btn-primary" Text="Submit" OnClick="btn_newpayee_Click" />
    
  
</div>
       </div>
</asp:Content>
