<%@ Page Title="" Language="C#" MasterPageFile="~/THFinance.Master" AutoEventWireup="true" CodeBehind="BorrowerRegistration.aspx.cs" Inherits="THFinance.BorrowerRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    

    
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="griddiv" runat="server" >
        <div class="col-md-12">
            <asp:Button ID="btn_Add" runat="server" OnClick="btn_Add_Click" Text="Add" CssClass="btn btn-sm btn-primary pull-right " />

        </div>
        <div class="col-md-12"><div class="table-responsive" >  

                                    <asp:GridView ID="gridregistration"  runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover example " AutoGenerateColumns="False"  EmptyDataText="There are no data records to display." AllowPaging="true">  
                                        <Columns>  
                                          <%--  <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" ReadOnly="True" SortExpression="CustomerID" />  --%>
                                             

                            <%--<asp:ButtonField CommandName="editRecord"  ControlStyle-CssClass="btn btn-info" ButtonType="Button" Text="Edit" HeaderText="Edit Record" >

                             

                            </asp:ButtonField>--%>
                                            <asp:BoundField DataField="borrowerName" HeaderText="Name" SortExpression="totalpayment"  />  
                                            <asp:BoundField DataField="borrowerFatherName" HeaderText="FatherName" SortExpression="presentDate"/>  
                                            <asp:BoundField DataField="BorrowerDesignation" HeaderText="Designation" SortExpression="paidAmount"  />  
                                            <asp:BoundField DataField="borrowerPhone" HeaderText="Phone" SortExpression="remainingAmount"  /> 
                                            <asp:BoundField DataField="borrowerAddress" HeaderText="Address" SortExpression="CHITTI_NAME"  /> 
                                            <asp:BoundField DataField="borrowerPhoto" HeaderText="Photo" SortExpression="remainingdays"  /> 
                                             <asp:BoundField DataField="borrowerproof" HeaderText="borrowerproof" SortExpression="remainingdays"  /> 
                                            <asp:BoundField DataField="borrowerproofType" HeaderText="borrowerproofType" SortExpression="remainingdays"  /> 
                                            
                                             <asp:TemplateField>
                                                 <ItemTemplate>
                                                     <asp:LinkButton ID="lnk_Edit" runat="server" CommandArgument='<%# Eval("borrowerId") %>'
                                                            OnCommand="lnk_Edit_Command" meta:resourcekey="lnk_Edit">Edit</asp:LinkButton>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                         
                                           
                                        </Columns>  
                                        
                                        
                                    </asp:GridView>  
                                </div></div>
    
    
        </div>
    <div id="form1"  runat="server" class="form-horizontal" visible="false">


        <h2 class="text-center">Registration</h2>


    <div class="row">
        <div class="col-md-6">
             <asp:Label ID="lbl_id" runat="server" Visible="false"></asp:Label>
        <div>
            <div class="form-box" id="login-box">
               
              
                <div class="body bg-gray">
                    
                    

                     <div class="form-group">
        <label class="col-md-3 control-label">Full name</label>
        <div class="col-md-6">
            <asp:TextBox ID="txt_barrowername"  runat="server" CssClass="form-control input-md"  ></asp:TextBox>
            

        </div>
                         <asp:RequiredFieldValidator ID="rfv_txt_barrowername" runat="server" ControlToValidate="txt_barrowername"
                                        meta:resourcekey="txt_barrowername" ErrorMessage="Please Select Course Name" Text="*" ForeColor="Red"
                                         ValidationGroup="Controls"></asp:RequiredFieldValidator>
    </div>
    <div class="form-group">
        <label class="col-md-3 control-label">S/O</label>
        <div class="col-md-6">
             <asp:TextBox ID="txt_barrowerfathername" runat="server" CssClass="form-control input-md" ></asp:TextBox>
           
        </div>
         <asp:RequiredFieldValidator ID="rfv_txt_barrowerfathername" runat="server" ControlToValidate="txt_barrowerfathername" ErrorMessage="please enter father name"  ValidationGroup="Controls" ForeColor="Red">*</asp:RequiredFieldValidator>
    </div>
    <div class="form-group">
        <label class="col-md-3 control-label">Phone</label>
        <div class="col-md-6">
            <asp:TextBox ID="txt_barrowerphone" runat="server" CssClass="form-control input-md" ></asp:TextBox>
           
        </div>
         <asp:RequiredFieldValidator ID="rfv_txt_barrowerphone" runat="server" ControlToValidate="txt_barrowerphone" ErrorMessage="please enter phone number"  ValidationGroup="Controls" ForeColor="Red">*</asp:RequiredFieldValidator>
    </div>
    <div class="form-group">
        <label class="col-md-3 control-label">Designation</label>
        <div class="col-md-6">
             <asp:TextBox ID="txt_barrowerdesignation" runat="server" CssClass="form-control input-md" ClientIDMode="Static"></asp:TextBox>
           
        </div>
         <asp:RequiredFieldValidator ID="rfv_txt_barrowerdesignation" runat="server" ControlToValidate="txt_barrowerdesignation" ErrorMessage="please enter Designation" ValidationGroup="Controls" ForeColor="Red">*</asp:RequiredFieldValidator>
    </div>
                </div>
                
            </div>
        </div>
     
    </div>
        
        <div class="col-md-6">


            
            <div class="form-group">
        <label class="col-md-3 control-label">Address</label>
        <div class="col-md-6">
              <asp:TextBox ID="txt_barroweraddresseee" runat="server" CssClass="form-control input-md" ></asp:TextBox>
           
        </div>
                 <asp:RequiredFieldValidator ID="rfv_txt_barroweraddresseee" runat="server" ControlToValidate="txt_barroweraddresseee" ErrorMessage="please enter Address"  ValidationGroup="Controls" ForeColor="Red">*</asp:RequiredFieldValidator>
    </div>
            <div class="form-group">
  <label class="col-md-3 control-label">Proof</label>
                <div class="col-md-6">
  <select class="form-control"  runat="server" id="txt_proof" >
        <option value="0">Select</option>
    <option value="1">Aadhar</option>
    <option value="2">VoterId</option>
    
  </select>
                    
                    </div>
                 <asp:RequiredFieldValidator ID="rfv_txt_proof" runat="server" ControlToValidate="txt_proof" ErrorMessage="please select one value"  ValidationGroup="Controls" ForeColor="Red">*</asp:RequiredFieldValidator>
</div>
            
             
            <div class="form-group">
        <label class="col-md-3 control-label">Proof file</label>
        <div class="col-md-6">
             <input type="file" id="txt_prooffile" runat="server"  class="form-control input-md" />
              
        </div>
                <asp:RequiredFieldValidator ID="rfv_txt_prooffile" runat="server" ControlToValidate="txt_prooffile" ErrorMessage="please select one value"  ValidationGroup="Controls" ForeColor="Red">*</asp:RequiredFieldValidator>
    </div>
            
            <div class="form-group">
        <label class="col-md-3 control-label">Photo</label>
        <div class="col-md-6">
             <input type="file" id="txt_photo" runat="server" class="form-control input-md"/>
           
        </div>
                  <asp:RequiredFieldValidator ID="rfv_txt_photo" runat="server" CssClass="control-label" ControlToValidate="txt_photo" ErrorMessage="please select one value"  ValidationGroup="Controls" ForeColor="Red">*</asp:RequiredFieldValidator>
    </div>
            <div class="form-group">
                 <div class="col-md-9 col-md-offset-3">
                    <asp:Button ID="btn_login" runat="server" Text="Login" CssClass="btn btn-primary bg-olive btn-sm" OnClick="btn_login_Click" ValidationGroup="Controls" />

                     <asp:Button ID="btn_update" runat="server" Text="Update" CssClass="btn btn-primary bg-olive btn-sm" OnClick="btn_update_Click" Visible="false" ValidationGroup="Controls"  />
                  
                      <asp:Button ID="btn_cancel" runat="server" Text="cancel" CssClass="btn btn-primary bg-olive btn-sm" OnClick="btn_cancel_Click"  Visible="false"   />
                  
                  </div>
                </div>
        </div>
        </div>
    </div>
    <%--<div class="row">
        <div id="contactForm" class="form-horizontal">
        <div class="col-md-6">
 
            
    <div class="form-group">
        <label class="col-md-3 control-label">Full name</label>
        <div class="col-md-6">
            <asp:TextBox ID="txt_barrowername"  runat="server" CssClass="form-control input-md"  ></asp:TextBox>
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-3 control-label">S/O</label>
        <div class="col-md-6">
             <asp:TextBox ID="txt_barrowerfathername" runat="server" CssClass="form-control input-md" ></asp:TextBox>
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-3 control-label">Phone</label>
        <div class="col-md-6">
            <asp:TextBox ID="txt_barrowerphone" runat="server" CssClass="form-control input-md" ></asp:TextBox>
        </div>
    </div>
    <div class="form-group">
        <label class="col-md-3 control-label">Designation</label>
        <div class="col-md-6">
             <asp:TextBox ID="txt_barrowerdesignation" runat="server" CssClass="form-control input-md" ></asp:TextBox>
        </div>
    </div>

      
               
</div>
            <div class="col-md-6">
              
               <div class="form-group">
        <label class="col-md-3 control-label">Address</label>
        <div class="col-md-6">
              <asp:TextBox ID="txt_barroweraddresseee" runat="server" CssClass="form-control input-md" ></asp:TextBox>
        </div>
    </div>
    <!-- #messages is where the messages are placed inside -->
    <div class="form-group">
        <div class="col-md-9 col-md-offset-3">
            <div id="messages"></div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-md-9 col-md-offset-3">
            <asp:Button ID="btn_submit" runat="server" CssClass="btn btn-default" Text="Validate" OnClick="btn_submit_Click" />
          
        </div>
    </div>

          </div>
            
        </div>

          
    </div>--%>
</asp:Content>
