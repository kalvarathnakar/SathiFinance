<%@ Page Title="" Language="C#" MasterPageFile="~/THFinance.Master" AutoEventWireup="true" CodeBehind="Guarantee.aspx.cs" Inherits="THFinance.Guarantee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="col-md-12">
            <asp:Button ID="btn_Addguarantee" runat="server" OnClick="btn_Addguarantee_Click" Text="Add" CssClass="btn btn-sm btn-primary pull-right " />

        </div>
        <div class="col-md-12">
            <div class="table-responsive" >  

                                    <asp:GridView ID="gridguaranteeregistration"  runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover example " AutoGenerateColumns="False"  EmptyDataText="There are no data records to display." AllowPaging="true">  
                                        <Columns>  
                                          <%--  <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" ReadOnly="True" SortExpression="CustomerID" />  --%>
                                             

                            <%--<asp:ButtonField CommandName="editRecord"  ControlStyle-CssClass="btn btn-info" ButtonType="Button" Text="Edit" HeaderText="Edit Record" >

                             

                            </asp:ButtonField>--%>
                                             <asp:BoundField DataField="borrowerName" HeaderText="Name" SortExpression="borrowerName"  />  
                                            <asp:BoundField DataField="GuarantorName" HeaderText="Name" SortExpression="totalpayment"  />  
                                            <asp:BoundField DataField="GuarantorFatherName" HeaderText="FatherName" SortExpression="presentDate"/>  
                                            <%--<asp:BoundField DataField="BorrowerDesignation" HeaderText="Designation" SortExpression="paidAmount"  />  --%>
                                            <asp:BoundField DataField="GuarantorPhone" HeaderText="Phone" SortExpression="remainingAmount"  /> 
                                            <asp:BoundField DataField="GuarantorAddress" HeaderText="Address" SortExpression="CHITTI_NAME"  /> 
                                            <asp:BoundField DataField="GuarantorProof" HeaderText="Photo" SortExpression="remainingdays"  /> 
                                             <asp:BoundField DataField="Guarantorphoto" HeaderText="borrowerproof" SortExpression="remainingdays"  /> 
                                            <asp:BoundField DataField="GuarantorProoftype" HeaderText="borrowerproofType" SortExpression="remainingdays"  /> 
                                            
                                             <asp:TemplateField>
                                                 <ItemTemplate>
                                                     <asp:LinkButton ID="lnk_Edit" runat="server" CommandArgument='<%# Eval("GuarantorId") %>'
                                                            OnCommand="lnk_Edit_Command" meta:resourcekey="lnk_Edit">Edit</asp:LinkButton>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                         
                                           
                                        </Columns>  
                                        
                                        
                                    </asp:GridView>  
                                </div></div>
    <div class="" id="formguarantee" runat="server">
        <h2 class="text-center">Guarantee Registration</h2>
        <div class="col-md-6">

            <div class="form-group">
                <label class="col-md-3 control-label">Borrower</label>
                <div class="col-md-9">
                    <asp:DropDownList ID="ddl_borrwer" runat="server" CssClass="form-control input-md"></asp:DropDownList>
                     <asp:RequiredFieldValidator ID="rfv_ddl_borrwer" runat="server" ControlToValidate="ddl_borrwer"
                    meta:resourcekey="txt_barrowername" ErrorMessage="Please Select Borrower Name" Text="*" ForeColor="Red"
                    ValidationGroup="Controls"></asp:RequiredFieldValidator>

                </div>
               
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label">Guarantee Name</label>
                <div class="col-md-9">
                    <asp:TextBox ID="txt_guaranteename" runat="server" CssClass="form-control input-md"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="rfv_txt_guaranteename" runat="server" ControlToValidate="txt_guaranteename" ErrorMessage="please enter Guarantee Name" ValidationGroup="Controls" ForeColor="Red">*</asp:RequiredFieldValidator>
                </div>
              
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label">S/O</label>
                <div class="col-md-9">
                    <asp:TextBox ID="txt_guaranteefathername" runat="server" CssClass="form-control input-md"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_guaranteefathername" runat="server" ControlToValidate="txt_guaranteefathername" ErrorMessage="please enter father name" ValidationGroup="Controls" ForeColor="Red">*</asp:RequiredFieldValidator>
                </div>
                
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Phone</label>
                <div class="col-md-9">
                    <asp:TextBox ID="txt_guaranteephone" runat="server" CssClass="form-control input-md"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="rfv_txt_guaranteephone" runat="server" ControlToValidate="txt_guaranteephone" ErrorMessage="please enter phone number" ValidationGroup="Controls" ForeColor="Red">*</asp:RequiredFieldValidator>
                </div>
               
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Designation</label>
                <div class="col-md-9">
                    <asp:TextBox ID="txt_guaranteedesignation" runat="server" CssClass="form-control input-md" ClientIDMode="Static"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="rfv_txt_guaranteedesignation" runat="server" ControlToValidate="txt_guaranteedesignation" ErrorMessage="please enter Designation" ValidationGroup="Controls" ForeColor="Red">*</asp:RequiredFieldValidator>
                </div>
               
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label class="col-md-3 control-label">Address</label>
                <div class="col-md-9">
                    <asp:TextBox ID="txt_guaranteeaddresseee" runat="server" CssClass="form-control input-md"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="rfv_txt_guaranteeaddresseee" runat="server" ControlToValidate="txt_guaranteeaddresseee" ErrorMessage="please enter Address" ValidationGroup="Controls" ForeColor="Red">*</asp:RequiredFieldValidator>
                </div>
               
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Proof</label>
                <div class="col-md-9">
                    <select class="form-control" runat="server" id="txt_guaranteeproof">
                        <option value="0">Select</option>
                        <option value="1">Aadhar</option>
                        <option value="2">VoterId</option>

                    </select>
                      <asp:RequiredFieldValidator ID="rfv_txt_guaranteeproof" runat="server" ControlToValidate="txt_guaranteeproof" ErrorMessage="please select one value" ValidationGroup="Controls" ForeColor="Red">*</asp:RequiredFieldValidator>
                </div>
              
            </div>


            <div class="form-group">
                <label class="col-md-3 control-label">Proof file</label>
                <div class="col-md-9">
                    <input type="file" id="txt_guaranteeprooffile" runat="server" class="form-control input-md" />
                    <asp:RequiredFieldValidator ID="rfv_txt_guaranteeprooffile" runat="server" ControlToValidate="txt_guaranteeprooffile" ErrorMessage="please select one value" ValidationGroup="Controls" ForeColor="Red">*</asp:RequiredFieldValidator>
                </div>
                
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label">Photo</label>
                <div class="col-md-9">
                    <input type="file" id="txt_guaranteephoto" runat="server" class="form-control input-md" />
 <asp:RequiredFieldValidator ID="rfv_txt_guaranteephoto" runat="server" CssClass="control-label" ControlToValidate="txt_guaranteephoto" ErrorMessage="please select one value" ValidationGroup="Controls" ForeColor="Red">*</asp:RequiredFieldValidator>
                </div>
               
            </div>
            <div class="form-group">
                <div class="col-md-9 col-md-offset-3">
                    <asp:Button ID="btn_login" runat="server" Text="Submit" CssClass="btn btn-primary bg-olive btn-sm" OnClick="btn_login_Click" ValidationGroup="Controls" />

                    <asp:Button ID="btn_update" runat="server" Text="Update" CssClass="btn btn-primary bg-olive btn-sm" OnClick="btn_update_Click" Visible="false" ValidationGroup="Controls" />

                    <asp:Button ID="btn_cancel" runat="server" Text="cancel" CssClass="btn btn-primary bg-olive btn-sm" OnClick="btn_cancel_Click" Visible="false" />

                </div>
            </div>
        </div>

    </div>

</asp:Content>
