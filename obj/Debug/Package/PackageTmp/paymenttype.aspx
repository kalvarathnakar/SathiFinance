<%@ Page Title="" Language="C#" MasterPageFile="~/THFinance.Master" AutoEventWireup="true" CodeBehind="paymenttype.aspx.cs" Inherits="THFinance.paymenttype" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div runat="server" id="paymentmethod">
     <div class="col-md-12">
            <asp:Button ID="btn_Addpayment" runat="server" OnClick="btn_Addpayment_Click" Text="Add" CssClass="btn btn-sm btn-primary pull-right " />

        </div>
        <div class="col-md-12">
            <div class="table-responsive" >  

                                    <asp:GridView ID="gridpayment"  runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover example " AutoGenerateColumns="False"  EmptyDataText="There are no data records to display." AllowPaging="true">  
                                        <Columns>  
                                          <%--  <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" ReadOnly="True" SortExpression="CustomerID" />  --%>
                                             

                            <%--<asp:ButtonField CommandName="editRecord"  ControlStyle-CssClass="btn btn-info" ButtonType="Button" Text="Edit" HeaderText="Edit Record" >

                             

                            </asp:ButtonField>--%>
                                             <asp:BoundField DataField="borrowerName" HeaderText="Name" SortExpression="borrowerName"  />  
                                            <asp:BoundField DataField="PaymentType" HeaderText="PaymentType" SortExpression="PaymentType"  />  
                                            <asp:BoundField DataField="PaymentDate" HeaderText="PaymentDate" SortExpression="PaymentDate"/>  
                                            <%--<asp:BoundField DataField="BorrowerDesignation" HeaderText="Designation" SortExpression="paidAmount"  />  --%>
                                            <asp:BoundField DataField="PaymentAmount" HeaderText="PaymentAmount" SortExpression="PaymentAmount"  /> 
                                          <asp:BoundField DataField="givenamount" HeaderText="givenamount" SortExpression="givenamount"  /> 
                                            
                                             <asp:TemplateField>
                                                 <ItemTemplate>
                                                     <asp:LinkButton ID="lnk_Edit" runat="server" CommandArgument='<%# Eval("paymentId") %>'
                                                            OnCommand="lnk_Edit_Command" meta:resourcekey="lnk_Edit">Edit</asp:LinkButton>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                         
                                           
                                        </Columns>  
                                        
                                        
                                    </asp:GridView>  
                                </div></div>
        </div>
    <div class="" id="formguarantee" runat="server" visible="false">
        <h2 class="text-center">Guarantee Registration</h2>
        <div class="col-md-6">
            <asp:Label ID="lbl_id" runat="server" Visible="false"></asp:Label>
            <div class="form-group">
                <label class="col-md-3 control-label">Borrower</label>
                <div class="col-md-9">
                    <asp:DropDownList ID="ddl_paymentborrwer" runat="server" CssClass="form-control input-md"></asp:DropDownList>
                     <asp:RequiredFieldValidator ID="rfv_ddl_paymentborrwer" runat="server" ControlToValidate="ddl_paymentborrwer"
                    meta:resourcekey="ddl_paymentborrwer" ErrorMessage="Please Select Borrower Name" Text="*" ForeColor="Red"
                    ValidationGroup="Controls"></asp:RequiredFieldValidator>

                </div>
               
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Payment Method</label>
                <div class="col-md-9">
                   <asp:DropDownList ID="ddl_chitti" runat="server" CssClass="form-control" ></asp:DropDownList>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddl_chitti" ErrorMessage="please select one value" ValidationGroup="Controls" ForeColor="Red">*</asp:RequiredFieldValidator>
                </div>
              
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">PaymentType</label>
                <div class="col-md-9">
                    <select class="form-control" runat="server" id="txt_PaymentType">
                        <option value="Select">Select</option>
                        <option value="Cash">Cash</option>
                        <option value="Check">Check</option>

                    </select>
                      <asp:RequiredFieldValidator ID="rfv_txt_PaymentType" runat="server" ControlToValidate="txt_PaymentType" ErrorMessage="please select one value" ValidationGroup="Controls" ForeColor="Red">*</asp:RequiredFieldValidator>
                </div>
              
            </div>
            <div class="form-group">
                  <label class="col-md-3 control-label">Payment Date</label>
                 <div class="col-md-9">
                <div class='input-group date' id='datetimepicker1'>
      <%--<asp:TextBox ID="txt_startdate" runat="server" CssClass="form-control input-md" OnTextChanged="txt_startdate_TextChanged" AutoPostBack="true"  ></asp:TextBox>--%>
               
                  <input type='text' class="form-control" runat="server" ID="txt_startdate"  />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
                     </div>
                 
       </div>

            <div class="form-group">
                <label class="col-md-3 control-label">PaymentAmount</label>
                <div class="col-md-9">
                    <asp:TextBox ID="txt_PaymentAmount" runat="server" CssClass="form-control input-md" OnTextChanged="txt_PaymentAmount_TextChanged" AutoPostBack="true"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_PaymentAmount" runat="server" ControlToValidate="txt_PaymentAmount" ErrorMessage="please enter Payment Amount" ValidationGroup="Controls" ForeColor="Red">*</asp:RequiredFieldValidator>
                </div>
                
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label">Given Amount</label>
                <div class="col-md-9">
                    <asp:TextBox ID="txt_givenAmount" runat="server" CssClass="form-control input-md"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_givenAmount" ErrorMessage="please enter Payment Amount" ValidationGroup="Controls" ForeColor="Red">*</asp:RequiredFieldValidator>
                </div>
                
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label">Monthley Payment</label>
                <div class="col-md-9">
                    <asp:TextBox ID="txt_monthlypayment" runat="server" CssClass="form-control input-md"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_monthlypayment" ErrorMessage="please enter Payment Amount" ValidationGroup="Controls" ForeColor="Red">*</asp:RequiredFieldValidator>
                </div>
                
            </div>
            <div class="form-group">
                <div class="col-md-9 col-md-offset-3">
                    <asp:Button ID="btn_submit" runat="server" Text="Submit" CssClass="btn btn-primary bg-olive btn-sm" OnClick="btn_submit_Click" ValidationGroup="Controls" />

                    <asp:Button ID="btn_update" runat="server" Text="Update" CssClass="btn btn-primary bg-olive btn-sm" OnClick="btn_update_Click" Visible="false" ValidationGroup="Controls" />

                    <asp:Button ID="btn_cancel" runat="server" Text="cancel" CssClass="btn btn-primary bg-olive btn-sm" OnClick="btn_cancel_Click" />

                </div>
            </div>
            
        </div>
        

    </div>
</asp:Content>
