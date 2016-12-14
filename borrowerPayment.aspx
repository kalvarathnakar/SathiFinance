<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/THFinance.Master" AutoEventWireup="true" CodeBehind="borrowerPayment.aspx.cs" Inherits="THFinance.borrowerPayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/selectize.bootstrap3.css" rel="stylesheet" />
    <script src="js/selectize.js"></script>
    <script>

        $(function () {
          
            debugger;
            $('#ContentPlaceHolder1_ddl_Borroerpayeename').selectize({
                placeholder:"select borrower name",
             
               
                
                sortField: 'text'
               
            });
        });
        $(document).ready(function () {
            debugger;
            


            var x = parseInt($("#ContentPlaceHolder1_lbl_daily").text());
            var y = parseInt($("#ContentPlaceHolder1_lbl_daily5").text());
            var z = parseInt($("#ContentPlaceHolder1_lbl_dailylimit").text());
            Morris.Donut({
               
                element: 'donut-example',
                data: [
                  { label: "Today Payments", value:x },
                  { label: "last 5 days", value: y },
                  { label: "paymnet pending", value: z }
                ],
                colors:["green","red","yellow"]
            });
        })

      function datechange() {

          
          debugger;
          var s = document.getElementById("ContentPlaceHolder1_txt_startdate").value;
          var d = document.getElementById("ContentPlaceHolder1_txt_enddate").value;
          var paymentmethod=document.getElementById("ContentPlaceHolder1_ddl_chitti").value;

          var oneDay = 24 * 60 * 60 * 1000; // hours*minutes*seconds*milliseconds
          var firstDate = new Date(s);
          //var n = firstDate.getMonth();
          //if (n == 12)
          //{
          //    n = 1;
          //}
          var secondDate = new Date(d);

          debugger;
          //var result = new Date(s);
          //result.setDate(result.getDate());
          if (paymentmethod == 1) {

              if (firstDate.getTime() > secondDate.getTime()) {
                  alert("please select valiable date");
                  return;
              }
              else {
                  var diffDays = Math.round(Math.abs((firstDate.getTime() - secondDate.getTime()) / (oneDay)));
                  // diffDays = 30 - diffDays;
                  document.getElementById("ContentPlaceHolder1_txt_penalitydays").value = Math.floor(diffDays / 5);;
              }
             
          }
          else
          {
              if (firstDate.getTime() > secondDate.getTime())
              {
                  alert("please select valiable date");
                  return;
              }
              else {
                  var diffDays = Math.round(Math.abs((firstDate.getTime() - secondDate.getTime()) / (oneDay)));
                 // diffDays = 30 - diffDays;
                  document.getElementById("ContentPlaceHolder1_txt_penalitydays").value = diffDays;
              }
             
              
            

          }

          //var dd = result.getDate();
          //var mm = result.getMonth() + 1;
          //var y = result.getFullYear();
          //var someFormattedDate = mm + '/' + dd + '/' + y;
         
         
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
    

   
    <asp:Label ID="lbl_monthly" runat="server" Visible="false"></asp:Label>
    <div runat="server" id="paymentpage">
        <div class="col-md-12" style="margin-bottom:20px;">
            <asp:Button ID="btn_Addpayment" runat="server" OnClick="btn_Addpayment_Click" Text="Add" CssClass="btn btn-sm btn-primary pull-right " />

        </div>
        <div class="col-md-12">
            <div class="table-responsive">

                <asp:GridView ID="gridpaymentdetails" runat="server" Width="100%" CssClass="table table-striped table-bordered table-hover example " AutoGenerateColumns="False" EmptyDataText="There are no data records to display." AllowPaging="true" OnPageIndexChanging="gridpaymentdetails_PageIndexChanging">
                    <Columns>
                        <%--  <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" ReadOnly="True" SortExpression="CustomerID" />  --%>


                        <%--<asp:ButtonField CommandName="editRecord"  ControlStyle-CssClass="btn btn-info" ButtonType="Button" Text="Edit" HeaderText="Edit Record" >

                             

                            </asp:ButtonField>--%>
                        <asp:BoundField DataField="borrowerName" HeaderText="Name" SortExpression="borrowerName" />
                        <asp:BoundField DataField="CHITTI_NAME" HeaderText="CHITTI_NAME" SortExpression="CHITTI_NAME" />
                        <asp:BoundField DataField="manager_name" HeaderText="manager_name" SortExpression="manager_name" />

                       <%-- <asp:BoundField DataField="borrowerStartdate" HeaderText="borrowerStartdate" SortExpression="borrowerStartdate" />

                        <asp:BoundField DataField="borrowerPaymentdate" HeaderText="borrowerPaymentdate" SortExpression="borrowerPaymentdate" />--%>
                        <asp:BoundField DataField="totalpayment" HeaderText="totalpayment" SortExpression="totalpayment" />
                       
                        <asp:BoundField DataField="borrowerPayamount" HeaderText="borrowerPayamount" SortExpression="borrowerPayamount" />
                        
                        <asp:BoundField DataField="borrowerReaminingamount" HeaderText="borrowerReaminingamount" SortExpression="borrowerReaminingamount" />
                        <asp:BoundField DataField="borrowerPenalitydays" HeaderText="borrowerPenalitydays" SortExpression="borrowerPenalitydays" />

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnk_Edit" runat="server" CommandArgument='<%# Eval("borrowerPayid") %>'
                                    OnCommand="lnk_Edit_Command" meta:resourcekey="lnk_Edit">Edit</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>


                    </Columns>


                </asp:GridView>
            </div>
        </div>
    </div>
    <div runat="server" id="payregistration" visible="false">
        <div class="col-md-6">
            <asp:Label ID="lbl_id" runat="server" Visible="false"></asp:Label>
            <div class="form-group">
                <label for="email" class=" control-label">Name</label>
                <asp:DropDownList ID="ddl_Borroerpayeename" runat="server" DataTextField="borrowerName" DataValueField="borrowerId" OnSelectedIndexChanged="ddl_Borroerpayeename_SelectedIndexChanged" CssClass="form-control input-md" AutoPostBack="true"  single></asp:DropDownList>

                <asp:RequiredFieldValidator ID="rfv_ddl_Borroerpayeename" runat="server" ControlToValidate="ddl_Borroerpayeename"
                    meta:resourcekey="txt_barrowername" ErrorMessage="Please Select Course Name" Text="*" ForeColor="Red"
                    ValidationGroup="Controls"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="key" class=" control-label">Branch</label>
                <asp:DropDownList ID="ddl_branch" runat="server" CssClass="form-control input-md" AutoPostBack="true" OnSelectedIndexChanged="ddl_branch_SelectedIndexChanged"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfv_ddl_branch" runat="server" ControlToValidate="ddl_branch"
                    meta:resourcekey="ddl_branch" ErrorMessage="Please Select Branch Name" Text="*" ForeColor="Red" InitialValue="0"
                    ValidationGroup="Controls"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="key" class=" control-label">Manager</label>
                <asp:DropDownList ID="ddl_manager" runat="server" CssClass="form-control input-md" ></asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfv_ddl_manager" runat="server" ControlToValidate="ddl_manager"
                    meta:resourcekey="ddl_manager" ErrorMessage="Please Select Manager Name" Text="*" ForeColor="Red"
                    ValidationGroup="Controls"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label for="key" class="control-label">Payment Method</label>
                <asp:DropDownList ID="ddl_chitti" runat="server" CssClass="form-control input-md" Enabled="false"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfv_ddl_chitti" runat="server" ControlToValidate="ddl_chitti"
                    meta:resourcekey="ddl_chitti" ErrorMessage="Please Select Payment Method" Text="*" ForeColor="Red"
                    ValidationGroup="Controls"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label for="key" class=" control-label">Amount</label>
                <input class="form-control" name="text" type="number" runat="server" id="txt_amount">
                <asp:RequiredFieldValidator ID="rfv_txt_amount" runat="server" ControlToValidate="txt_amount"
                    meta:resourcekey="txt_amount" ErrorMessage="Please enter Amount" Text="*" ForeColor="Red"
                    ValidationGroup="Controls"></asp:RequiredFieldValidator>
            </div>

            

        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label for="key" class=" control-label">paidAmount</label>
                <asp:TextBox ID="txt_paidAmount" runat="server" CssClass="form-control" OnTextChanged="txt_paidAmount_TextChanged" AutoPostBack="true"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv_txt_paidAmount" runat="server" ControlToValidate="txt_paidAmount"
                    meta:resourcekey="txt_paidAmount" ErrorMessage="Please enter Paid Amount" Text="*" ForeColor="Red"
                    ValidationGroup="Controls"></asp:RequiredFieldValidator>
                <%-- <input class="form-control"  name="text" type="number" runat="server" id="txt_paidAmount"  >--%>
            </div>
            <div class="form-group">
                <label for="email" class=" control-label">remainingAmount</label>
                <asp:TextBox ID="txt_remainingAmount" runat="server" CssClass="form-control input-md"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv_txt_remainingAmount" runat="server" ControlToValidate="txt_remainingAmount"
                    meta:resourcekey="txt_remainingAmount" ErrorMessage="Please enter Remaining Amount" Text="*" ForeColor="Red"
                    ValidationGroup="Controls"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="key" class=" control-label">prepayDate</label>
                <div class='input-group date' id='datetimepicker1'>
                    <asp:TextBox ID="txt_startdate" runat="server" CssClass="form-control input-md"  AutoPostBack="true" Enabled="false"></asp:TextBox>

                    <%--  <%--<input type='text' class="form-control" runat="server" ID="txt_startdate" onchange="datechange()" />--%>
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                    <asp:RequiredFieldValidator ID="rfv_txt_startdate" runat="server" ControlToValidate="txt_startdate"
                        meta:resourcekey="txt_startdate" ErrorMessage="Please enter Start Date" Text="*" ForeColor="Red"
                        ValidationGroup="Controls"></asp:RequiredFieldValidator>
                </div>

            </div>
            <div class="form-group">
                <label for="key" class=" control-label">presentDate</label>
                <div class='input-group date' id='datetimepicker2'>
                    <%--<asp:TextBox ID="txt_enddate" runat="server" CssClass="form-control input-md"  AutoPostBack="true" OnTextChanged="txt_enddate_TextChanged"></asp:TextBox>--%>
                    <input type='text' class="form-control" runat="server" id="txt_enddate" onchange="datechange()"  />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                    <asp:RequiredFieldValidator ID="rfv_txt_enddate" runat="server" ControlToValidate="txt_enddate"
                        meta:resourcekey="txt_enddate" ErrorMessage="Please enter End Date" Text="*" ForeColor="Red"
                        ValidationGroup="Controls"></asp:RequiredFieldValidator>
                </div>

            </div>

            <div class="form-group">
                <label for="email" class=" control-label">Penality Days</label>
                <input type='text' class="form-control" runat="server" ID="txt_penalitydays"    />
        
                <asp:RequiredFieldValidator ID="rfv_txt_penalitydays" runat="server" ControlToValidate="txt_penalitydays"
                    meta:resourcekey="txt_penalitydays" ErrorMessage="Please enter Penality Days" Text="*" ForeColor="Red"
                    ValidationGroup="Controls"></asp:RequiredFieldValidator>
            </div>


            <div class="form-group">
              
                    <asp:Button ID="btn_submit" runat="server" Text="Submit" CssClass="btn btn-primary bg-olive btn-sm" OnClick="btn_submit_Click" ValidationGroup="Controls" />

                    <asp:Button ID="btn_update" runat="server" Text="Update" CssClass="btn btn-primary bg-olive btn-sm" OnClick="btn_update_Click" Visible="false" ValidationGroup="Controls" />

                    <asp:Button ID="btn_cancel" runat="server" Text="cancel" CssClass="btn btn-primary bg-olive btn-sm" OnClick="btn_cancel_Click" Visible="true" />

               
            </div>

        </div>
    </div>



</asp:Content>
