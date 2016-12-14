<%@ Page Title="" Language="C#" MasterPageFile="~/THFinance.Master" AutoEventWireup="true" CodeBehind="vehicle.aspx.cs" Inherits="THFinance.vehicle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="griddiv" runat="server">
    <div class="col-md-12">
            <asp:Button ID="btn_AddVehicle" runat="server" OnClick="btn_Addguarantee_Click" Text="Add" CssClass="btn btn-sm btn-primary pull-right " />

        </div>
        <div class="col-md-12">
            <div class="table-responsive" >  

                                    <asp:GridView ID="gridVehicle"  runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover example " AutoGenerateColumns="False"  EmptyDataText="There are no data records to display." AllowPaging="true">  
                                        <Columns>  
                                          <%--  <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" ReadOnly="True" SortExpression="CustomerID" />  --%>
                                             

                            <%--<asp:ButtonField CommandName="editRecord"  ControlStyle-CssClass="btn btn-info" ButtonType="Button" Text="Edit" HeaderText="Edit Record" >

                             

                            </asp:ButtonField>--%>
                                             <asp:BoundField DataField="VehicleType" HeaderText="VehicleType" SortExpression="VehicleType"  />  
                                            <asp:BoundField DataField="Vehiclemodel" HeaderText="Vehiclemodel" SortExpression="Vehiclemodel"  />  
                                            <asp:BoundField DataField="VehicleChasisNo" HeaderText="VehicleChasisNo" SortExpression="VehicleChasisNo"/>  
                                            <%--<asp:BoundField DataField="BorrowerDesignation" HeaderText="Designation" SortExpression="paidAmount"  />  --%>
                                            <asp:BoundField DataField="VehicleEngineNo" HeaderText="VehicleEngineNo" SortExpression="VehicleEngineNo"  /> 
                                            <asp:BoundField DataField="VehicleBHP" HeaderText="VehicleBHP" SortExpression="VehicleBHP"  /> 
                                            <asp:BoundField DataField="VehicleColor" HeaderText="VehicleColor" SortExpression="VehicleColor"  /> 
                                             <asp:BoundField DataField="VehicleKeyNo" HeaderText="VehicleKeyNo" SortExpression="VehicleKeyNo"  /> 
                                            <asp:BoundField DataField="VehicleInsurance" HeaderText="VehicleInsurance" SortExpression="VehicleInsurance"  /> 
                                            <asp:BoundField DataField="borrowerName" HeaderText="borrowerName" SortExpression="borrowerName"  /> 
                                            
                                             <asp:TemplateField>
                                                 <ItemTemplate>
                                                     <asp:LinkButton ID="lnk_Edit" runat="server" CommandArgument='<%# Eval("VehicleId") %>'
                                                            OnCommand="lnk_Edit_Command" meta:resourcekey="lnk_Edit">Edit</asp:LinkButton>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                         
                                           
                                        </Columns>  
                                        
                                        
                                    </asp:GridView>  
                                </div>

        </div>
        </div>
    <div class="" id="formguarantee" runat="server">
        <h2 class="text-center">Vehicle Registration</h2>
        <asp:Label ID="lbl_id" runat="server" Visible="false"></asp:Label>
        <div class="col-md-6">

            <div class="form-group">
                <label class="col-md-3 control-label">Borrower</label>
                <div class="col-md-9">
                    <asp:DropDownList ID="ddl_vehicelborrwer" runat="server" CssClass="form-control input-md"></asp:DropDownList>
                     <asp:RequiredFieldValidator ID="rfv_ddl_vehicelborrwer" runat="server" ControlToValidate="ddl_vehicelborrwer"
                    meta:resourcekey="txt_barrowername" ErrorMessage="Please Select Borrower Name" Text="*" ForeColor="Red"
                    ValidationGroup="Controls"></asp:RequiredFieldValidator>

                </div>
               
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label">Vehicle  model</label>
                <div class="col-md-9">
                    <asp:TextBox ID="txt_vehiclemodel" runat="server" CssClass="form-control input-md"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="rfv_txt_vehiclemodel" runat="server" ControlToValidate="txt_vehiclemodel" ErrorMessage="please enter vehicle model" ValidationGroup="Controls" ForeColor="Red">*</asp:RequiredFieldValidator>
                </div>
              
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label">Chasis Number</label>
                <div class="col-md-9">
                    <asp:TextBox ID="txt_vehiclechasis" runat="server" CssClass="form-control input-md"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_txt_vehiclechasis" runat="server" ControlToValidate="txt_vehiclechasis" ErrorMessage="please enter Chasis number" ValidationGroup="Controls" ForeColor="Red">*</asp:RequiredFieldValidator>
                </div>
                
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Engine Number</label>
                <div class="col-md-9">
                    <asp:TextBox ID="txt_enginenumber" runat="server" CssClass="form-control input-md"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="rfv_txt_enginenumber" runat="server" ControlToValidate="txt_enginenumber" ErrorMessage="please enter Engine number" ValidationGroup="Controls" ForeColor="Red">*</asp:RequiredFieldValidator>
                </div>
               
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">B.H.P</label>
                <div class="col-md-9">
                    <asp:TextBox ID="txt_vehiclebhp" runat="server" CssClass="form-control input-md" ClientIDMode="Static"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="rfv_txt_vehiclebhp" runat="server" ControlToValidate="txt_vehiclebhp" ErrorMessage="please enter B.H.P" ValidationGroup="Controls" ForeColor="Red">*</asp:RequiredFieldValidator>
                </div>
               
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label class="col-md-3 control-label">Colour</label>
                <div class="col-md-9">
                    <asp:TextBox ID="txt_vehiclecolour" runat="server" CssClass="form-control input-md"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="rfv_txt_vehiclecolour" runat="server" ControlToValidate="txt_vehiclecolour" ErrorMessage="please enter Address" ValidationGroup="Controls" ForeColor="Red">*</asp:RequiredFieldValidator>
                </div>
               
            </div>
            <div class="form-group">
                <label class="col-md-3 control-label">Vehicle Type</label>
                <div class="col-md-9">
                    <select class="form-control" runat="server" id="txt_VehicleType">
                        <option value="Select">Select</option>
                        <option value="New">New</option>
                        <option value="Old">Old</option>

                    </select>
                      <asp:RequiredFieldValidator ID="rfv_txt_guaranteeproof" runat="server" ControlToValidate="txt_VehicleType" ErrorMessage="please select one value" ValidationGroup="Controls" ForeColor="Red">*</asp:RequiredFieldValidator>
                </div>
              
            </div>


            <div class="form-group">
                <label class="col-md-3 control-label">Key Number</label>
                <div class="col-md-9">
                    <input type="text" id="txt_vehiclekey" runat="server" class="form-control input-md" />
                    <asp:RequiredFieldValidator ID="rfv_txt_vehiclekey" runat="server" ControlToValidate="txt_vehiclekey" ErrorMessage="please select vehicle key Number" ValidationGroup="Controls" ForeColor="Red">*</asp:RequiredFieldValidator>
                </div>
                
            </div>

            <div class="form-group">
                <label class="col-md-3 control-label">Insurance</label>
                <div class="col-md-9">
                    <input type="file" id="txt_vehicleinsurance" runat="server" class="form-control input-md" />
 <asp:RequiredFieldValidator ID="rfv_txt_vehicleinsurance" runat="server" CssClass="control-label" ControlToValidate="txt_vehicleinsurance" ErrorMessage="please select one value" ValidationGroup="Controls" ForeColor="Red">*</asp:RequiredFieldValidator>
                </div>
               
            </div>
            <div class="form-group">
                <div class="col-md-9 col-md-offset-3">
                    <asp:Button ID="btn_submit" runat="server" Text="Submit" CssClass="btn btn-primary bg-olive btn-sm" OnClick="btn_submit_Click" ValidationGroup="Controls" />

                    <asp:Button ID="btn_update" runat="server" Text="Update" CssClass="btn btn-primary bg-olive btn-sm" OnClick="btn_update_Click" Visible="false" ValidationGroup="Controls" />

                    <asp:Button ID="btn_cancel" runat="server" Text="cancel" CssClass="btn btn-primary bg-olive btn-sm" OnClick="btn_cancel_Click" Visible="false" />

                </div>
            </div>
        </div>

    </div>

</asp:Content>
