<%@ Page Title="" Language="C#" MasterPageFile="~/THFinance.Master" AutoEventWireup="true" CodeBehind="PayeeDetails.aspx.cs" Inherits="THFinance.PayeeDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-group">
    				<label for="country" class="control-label">	
    					Branch
    				</label>
    				<div class="controls">
    					<asp:DropDownList ID="ddl_payeeName" runat="server" CssClass="form-control input-md" OnSelectedIndexChanged="ddl_payeeName_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        </div>
            </div>
    <div class="table-responsive" >  
                                    <asp:GridView ID="grdpayeeDetails"  runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover example " AutoGenerateColumns="False"  EmptyDataText="There are no data records to display." AllowPaging="true">  
                                        <Columns>  
                                          <%--  <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" ReadOnly="True" SortExpression="CustomerID" />  --%>
                                             

                            <%--<asp:ButtonField CommandName="editRecord"  ControlStyle-CssClass="btn btn-info" ButtonType="Button" Text="Edit" HeaderText="Edit Record" >

                             

                            </asp:ButtonField>--%>
                                            <asp:BoundField DataField="totalpayment" HeaderText="Total payment" SortExpression="totalpayment"  />  
                                            <asp:BoundField DataField="presentDate" HeaderText="Payment Date" SortExpression="presentDate"/>  
                                            <asp:BoundField DataField="paidAmount" HeaderText="Daily payamount" SortExpression="paidAmount"  />  
                                            <asp:BoundField DataField="remainingAmount" HeaderText="Remaining Amount" SortExpression="remainingAmount"  /> 
                                            <asp:BoundField DataField="CHITTI_NAME" HeaderText="Payment Method" SortExpression="CHITTI_NAME"  /> 
                                            <asp:BoundField DataField="remainingdays" HeaderText="Remaining days" SortExpression="remainingdays"  /> 
                                            
                                             
                                          
                                           
                                        </Columns>  
                                        
                                        
                                    </asp:GridView>  
                                </div>
</asp:Content>
