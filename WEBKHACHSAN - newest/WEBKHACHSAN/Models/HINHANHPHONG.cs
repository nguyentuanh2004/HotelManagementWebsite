//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WEBKHACHSAN.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class HINHANHPHONG
    {
        public int IDHINHANHPHONG { get; set; }
        public string TENHINHANHPHONG { get; set; }
        public Nullable<int> IDPHONG { get; set; }
        public Nullable<int> VITRI { get; set; }
    
        public virtual PHONG PHONG { get; set; }
    }
}
