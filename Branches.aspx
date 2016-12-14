<%@ Page Title="" Language="C#" MasterPageFile="~/THFinance.Master" AutoEventWireup="true" CodeBehind="Branches.aspx.cs" Inherits="THFinance.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="table-responsive" >  
                                    <asp:GridView ID="grdBranch"  runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover example " AutoGenerateColumns="False"  EmptyDataText="There are no data records to display." AllowPaging="true">  
                                        <Columns>  
                                          <%--  <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" ReadOnly="True" SortExpression="CustomerID" />  --%>
                                             

                            <%--<asp:ButtonField CommandName="editRecord"  ControlStyle-CssClass="btn btn-info" ButtonType="Button" Text="Edit" HeaderText="Edit Record" >

                               

                            </asp:ButtonField>--%>
                                            <asp:BoundField DataField="branchName" HeaderText="branchName" SortExpression="branchName" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />  
                                          
                                           
                                        </Columns>  
                                        
                                        
                                    </asp:GridView>  
                                </div>                                                                                                                                                                                                                                                                                 
    <div class="form-group">
  <label class="col-md-4 control-label" for="Nome">Branch</label>  
  <div class="col-md-4">
  
    <asp:TextBox ID="txt_branch" runat="server" CssClass="form-control input-md"></asp:TextBox>
  </div>
</div>

    <div class="form-group">
  <label class="col-md-4 control-label" for="Invio"></label>
  <div class="col-md-4">
      <asp:Button ID="btn_brnach" runat="server"  CssClass="btn btn-primary" Text="Submit" OnClick="btn_brnach_Click" />
    
  </div>
</div>
    


</asp:Content>
