//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace THFinance
{
    using System;
    using System.Collections.Generic;
    
    public partial class tbl_Borrowerpayment
    {
        public int pay_BranchId { get; set; }
        public int PayId { get; set; }
        public int pay_LoantypeId { get; set; }
        public int pay_managerid { get; set; }
        public System.DateTime pay_borowerStartDate { get; set; }
        public System.DateTime paymentDate { get; set; }
        public int paidAmount { get; set; }
        public int borrowerRemainingAmount { get; set; }
        public int borrowerRemainingDays { get; set; }
        public int penalityAmount { get; set; }
        public int penalityDays { get; set; }
    }
}