<%@ Page Title="" Language="C#" MasterPageFile="~/THFinance.Master" AutoEventWireup="true" CodeBehind="Payement.aspx.cs" Inherits="THFinance.Payement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-wrap">
                <h1>New Payee</h1>
               
                        <div class="form-group">
                            <label  for="email" class=" control-label">Name</label>
                           <asp:DropDownList ID="ddl_payeename" runat="server" OnSelectedIndexChanged="ddl_payeename_SelectedIndexChanged" CssClass="form-control input-md" AutoPostBack="true" ></asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="key" class=" control-label">Branch</label>
                           <asp:DropDownList ID="ddl_branch" runat="server" CssClass="form-control input-md"  AutoPostBack="true" Enabled="false"></asp:DropDownList>
                        </div>
         <div class="form-group">
                            <label for="key" class=" control-label">Manager</label>
                           <asp:DropDownList ID="ddl_manager" runat="server" CssClass="form-control input-md" Enabled="false"></asp:DropDownList>
                        </div>

          <div class="form-group">
                            <label for="key" class="control-label">Payment Method</label>
                           <asp:DropDownList ID="ddl_chitti" runat="server" CssClass="form-control input-md" Enabled="false" ></asp:DropDownList>
                        </div>
          
           <div class="form-group">
                            <label for="key" class=" control-label">Amount</label>
                              <input class="form-control"  name="text" type="number" runat="server" id="txt_amount" >
                        </div>
          <div class="form-group">
                            <label for="key" class=" control-label">paidAmount</label>
              <asp:TextBox id="txt_paidAmount"  runat="server" CssClass="form-control" OnTextChanged="txt_paidAmount_TextChanged" AutoPostBack="true"></asp:TextBox>
                             <%-- <input class="form-control"  name="text" type="number" runat="server" id="txt_paidAmount"  >--%>
                        </div>
        <div class="form-group">
                            <label for="email" class=" control-label">remainingAmount</label>
                            <asp:TextBox ID="txt_remainingAmount" runat="server" CssClass="form-control input-md"></asp:TextBox>
                        </div>
         
          <div class="form-group">
                <label for="key" class=" control-label">prepayDate</label>
                <div class='input-group date' id='datetimepicker1'>
      <asp:TextBox ID="txt_startdate" runat="server" CssClass="form-control input-md"  AutoPostBack="true" Enabled="false" ></asp:TextBox>
               
                 <%--  <%--<input type='text' class="form-control" runat="server" ID="txt_startdate" onchange="datechange()" />--%>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
                 
       </div>
          <div class="form-group">
                <label for="key" class=" control-label">presentDate</label>
                <div class='input-group date' id='datetimepicker2'>
                    <input type='text' class="form-control" runat="server" id="txt_enddate" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>

              </div>
          <div class="form-group">

  
      <asp:Button ID="btn_payee" runat="server"  CssClass="btn btn-primary" Text="Submit" OnClick="btn_payee_Click" />
    
  
</div>
       </div>
</asp:Content>
