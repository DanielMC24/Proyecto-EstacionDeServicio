//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AutoFixProyectoWeb.ModelDB
{
    using System;
    using System.Collections.Generic;
    
    public partial class CATEGORIA
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CATEGORIA()
        {
            this.INVENTARIO = new HashSet<INVENTARIO>();
        }
    
        public int ID_CATEGORIA { get; set; }
        public int ID_PROVEEDOR { get; set; }
        public string CATEGORIA1 { get; set; }
        public string DESCRIPCION { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<INVENTARIO> INVENTARIO { get; set; }
        public virtual PROVEEDOR PROVEEDOR { get; set; }
    }
}
