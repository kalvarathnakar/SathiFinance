<%@ Page Title="" Language="C#" MasterPageFile="~/THFinance.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="THFinance.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     
   
    <script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
  <script src="http://cdn.oesmith.co.uk/morris-0.4.1.min.js"></script>
    <script>
        $(document).ready(function () {
            debugger;
            


            var x = parseInt($("#ContentPlaceHolder1_lbl_daily").text());
            var y = parseInt($("#ContentPlaceHolder1_lbl_daily5").text());
            var z = parseInt($("#ContentPlaceHolder1_lbl_dailylimit").text());
            var a = parseInt($("#ContentPlaceHolder1_lbl_monthly").text());
            var b = parseInt($("#ContentPlaceHolder1_lbl_monthly2").text());
            var c = parseInt($("#ContentPlaceHolder1_lbl_monthly5").text());
            Morris.Donut({
               
                element: 'donut-example',
                data: [
                  { label: "Today Payments", value:x },
                  { label: "last 5 days", value: y },
                  { label: "paymnet pending", value: z }
                 
                ],
                colors:["green","yellow","red"]
            });

            Morris.Donut({

                element: 'donut-example1',
                data: [
                 
                  { label: "Today Payments", value: a },
                  { label: "last 2 months ", value: b },
                  { label: "last 3 months ", value: c }
                ],
                colors: ["green", "yellow", "red"]
            });
        })

    
    
  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col=col-md-6 col-sm-6 col-xs-12">
            <div class="bg-primary" style="padding:1px 0px;">
                  <h3 class="text-center ">Daily payment List</h3>
            </div>
          
              <div id="donut-example"></div>

            <table class="table table-bordered table-hover">
      <thead>
          <tr>
              <th>Payment </th>
              <th>Count</th>
          </tr>
      </thead>
      <tbody>
          <tr>
              <td  >Today Payment List</td>
              <td style="background-color:green; color:#000"><asp:Label ID="lbl_daily" runat="server" Visible="true"></asp:Label></td>
          </tr>
          <tr>
              <td >Last 5 Days List</td>
              <td style="background-color:yellow; color:#000"><asp:Label ID="lbl_daily5" runat="server" Visible="true"></asp:Label></td>
          </tr>
          <tr>
              <td >Last 5 Days Before List</td>
              <td style="background-color:red; color:#000"> <asp:Label ID="lbl_dailylimit" runat="server" Visible="true"></asp:Label></td>
          </tr>
      </tbody>
  </table>
        </div>
        <div class="col=col-md-6 col-sm-6 col-xs-12">
              <div class="bg-primary" style="padding:1px 0px;">
                  <h3 class="text-center ">Monthly payment List</h3>
            </div>
            
              <div id="donut-example1"></div>

            <table class="table table-bordered table-hover">
      <thead>
          <tr>
              <th>Payment </th>
              <th>Count</th>
          </tr>
      </thead>
      <tbody>
          <tr>
              <td  >Today Payment List</td>
              <td style="background-color:green; color:#000"><asp:Label ID="lbl_monthly" runat="server" Visible="true"></asp:Label></td>
          </tr>
          <tr>
              <td >Last 2 months List</td>
              <td style="background-color:yellow; color:#000"><asp:Label ID="lbl_monthly2" runat="server" Visible="true"></asp:Label></td>
          </tr>
          <tr>
              <td >before 3 months Before List</td>
              <td style="background-color:red; color:#000"> <asp:Label ID="lbl_monthly5" runat="server" Visible="true"></asp:Label></td>
          </tr>
      </tbody>
  </table>
        </div>
    </div>
  
   
    
   
</asp:Content>
