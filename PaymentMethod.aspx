<%@ Page Title="" Language="C#" MasterPageFile="~/THFinance.Master" AutoEventWireup="true" CodeBehind="PaymentMethod.aspx.cs" Inherits="THFinance.PaymentMethod" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="table-responsive" >  
                                    <asp:GridView ID="grdPayment"  runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover example " AutoGenerateColumns="False"  EmptyDataText="There are no data records to display." AllowPaging="true">  
                                        <Columns>  
                                          <%--  <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" ReadOnly="True" SortExpression="CustomerID" />  --%>
                                             

                            <%--<asp:ButtonField CommandName="editRecord"  ControlStyle-CssClass="btn btn-info" ButtonType="Button" Text="Edit" HeaderText="Edit Record" >

                               

                            </asp:ButtonField>--%>
                                            <asp:BoundField DataField="CHITTI_NAME" HeaderText="Payment Name" SortExpression="CHITTI_NAME" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />  
                                          
                                           
                                        </Columns>  
                                        
                                        
                                    </asp:GridView>  
                                </div>     
    
   <%--<div class="container">
    <div class="row">
        <div class='col-sm-6'>
            <div class="form-group">
                <div class='input-group date' id='datetimepicker1'>
                    <input type='text' class="form-control" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
            </div>
        </div>
       
    </div>
</div>--%>                                                                                                                                                                                                                                                                   
    <div class="form-group">
  <label class="col-md-4 control-label" for="Nome">Payment Method</label>  
  <div class="col-md-4">
  
    <asp:TextBox ID="txt_payment" runat="server" CssClass="form-control input-md"></asp:TextBox>
  </div>
</div>

    <div class="form-group">

  <div class="col-md-4">
      <asp:Button ID="btn_payment" runat="server"  CssClass="btn btn-primary" Text="Submit" OnClick="btn_payment_Click" />
    
  </div>
</div>
    
</asp:Content>
