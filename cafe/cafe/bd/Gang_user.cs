//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace cafe.bd
{
    using System;
    using System.Collections.Generic;
    
    public partial class Gang_user
    {
        public Nullable<int> id_user { get; set; }
        public Nullable<int> id_gang { get; set; }
        public int id_user_gang { get; set; }
    
        public virtual Gang Gang { get; set; }
        public virtual User User { get; set; }
    }
}
