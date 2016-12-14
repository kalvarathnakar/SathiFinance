<%@ Page Title="" Language="C#" MasterPageFile="~/THFinance.Master" AutoEventWireup="true" CodeBehind="Mangers.aspx.cs" Inherits="THFinance.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="table-responsive" >  
                                    <asp:GridView ID="grdManager"  runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover example " AutoGenerateColumns="False"  EmptyDataText="There are no data records to display." AllowPaging="true">  
                                        <Columns>  
                                          <%--  <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" ReadOnly="True" SortExpression="CustomerID" />  --%>
                                             

                            <%--<asp:ButtonField CommandName="editRecord"  ControlStyle-CssClass="btn btn-info" ButtonType="Button" Text="Edit" HeaderText="Edit Record" >

                               

                            </asp:ButtonField>--%>
                                            <asp:BoundField DataField="branchName" HeaderText="branchName" SortExpression="branchName" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />  
                                            <asp:BoundField DataField="manager_name" HeaderText="Manager Name" SortExpression="manager_name" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />  
                                          
                                           
                                        </Columns>  
                                        
                                        
                                    </asp:GridView>  
                                </div>
    	<div class="form-group">
    				<label for="country" class="control-label">	
    					Branch
    				</label>
    				<div class="controls">
    					<asp:DropDownList ID="ddl_branch" runat="server" CssClass="form-control input-md"></asp:DropDownList>
                        </div>
            </div>
    <div class="form-group">
  <label class="col-md-4 control-label" for="Nome">Manager</label>  
  <div class="col-md-4">
  
    <asp:TextBox ID="txt_manager" runat="server" CssClass="form-control input-md"></asp:TextBox>
  </div>
</div>
    <div class="form-group">
  <label class="col-md-4 control-label" for="Invio"></label>
  <div class="col-md-4">
      <asp:Button ID="btn_managers" runat="server"  CssClass="btn btn-primary" Text="Submit" OnClick="btn_managers_Click" />
    
  </div>
</div>

</asp:Content>
