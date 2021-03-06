﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Entidades;
using Negocios;

namespace TainEns.paginas.Cliente.Negocios
{
    public partial class modificar_negocio : System.Web.UI.Page
    {
        E_Negocios ObjEN = new E_Negocios();
        N_Negocio ObjNN = new N_Negocio();
        E_UsuarioNegocios ObjEUN = new E_UsuarioNegocios();
        N_UsuarioNegocios ObjNUN = new N_UsuarioNegocios();
        E_HorarioNegocios ObjEHN = new E_HorarioNegocios();
        N_HorarioNegocios ObjNHN = new N_HorarioNegocios();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Iniciar();
            }
        }

        protected void Iniciar()
        {
            int IdNegocio = Convert.ToInt16(Session["IdNegocio"]);
            ObjEN = ObjNN.BuscarNegocioPorId(IdNegocio);
            ObjEHN = ObjNHN.BuscarHorarioNegociosPorIdNegocio(IdNegocio);
            EntradaL.Text = ObjEHN.LE.ToString();
            SalidaL.Text = Convert.ToString(ObjEHN.LS);
            Nombre.Text = ObjEN.NombreNegocio;
            RFC.Text = ObjEN.RFC;
            Calle.Text = ObjEN.CalleNegocio;
            ColFrac.Text = ObjEN.ColoniaNegocio;
            Numero.Text = Convert.ToString(ObjEN.NumeroCalle);
            CP.Text = Convert.ToString(ObjEN.CodigoPostal);
            Tipo.Text = ObjEN.TipoNegocio;
            Telefono.Text = ObjEN.TelefonoNegocio;
        }

        protected void Modificar_Click(object sender, EventArgs e)
        {
            if (Nombre.Text != "" && Calle.Text != "" && ColFrac.Text != "" && CP.Text != "" && Numero.Text != "")
            {
                ObjEN.IdNegocios = Convert.ToInt16(Session["IdNegocio"]);
                ObjEN.NombreNegocio = Nombre.Text;
                ObjEN.CalleNegocio = Calle.Text;
                ObjEN.ColoniaNegocio = ColFrac.Text;
                ObjEN.CodigoPostal = Convert.ToInt32(CP.Text);
                ObjEN.NumeroCalle = Convert.ToInt16(Numero.Text);
                ObjEN.TelefonoNegocio = Telefono.Text;
                ObjEN.EstadoNegocio = "3";
                ObjEN.TipoNegocio = Tipo.Text;
                ObjEN.RFC = RFC.Text;
                ObjEN.DiasLaborales = "1";
                string msnN = ObjNN.ModoficaNegocio(ObjEN);

                ObjEHN.IdNegocios = ObjEN.IdNegocios;
                ObjEHN.LE = Convert.ToInt16(EntradaL.Text);
                ObjEHN.LS = Convert.ToInt16(SalidaL.Text);
                ObjEHN.ME = Convert.ToInt16(EntradaMa.Text);
                ObjEHN.ME = Convert.ToInt16(SalidaMa.Text);
                ObjEHN.MIE = Convert.ToInt16(EntradaMi.Text);
                ObjEHN.MIE = Convert.ToInt16(SalidaMi.Text);
                ObjEHN.JE = Convert.ToInt16(EntradaJ.Text);
                ObjEHN.JS = Convert.ToInt16(SalidaJ.Text);
                ObjEHN.VE = Convert.ToInt16(EntradaV.Text);
                ObjEHN.VS = Convert.ToInt16(SalidaV.Text);
                ObjEHN.SE = Convert.ToInt16(EntradaS.Text);
                ObjEHN.SS = Convert.ToInt16(SalidaS.Text);
                ObjEHN.DE = Convert.ToInt16(EntradaD.Text);
                ObjEHN.DS = Convert.ToInt16(SalidaD.Text);
                string msnHN = ObjNHN.ModoficaHorarioNegocios(ObjEHN);

                //lblTituloModal.Text = "Agregado";
                // lblMensajeModal.Text = "Se ha enviado la solicitud. \nEn cuanto sea aceptada tu negocio estara disponible.";
                Response.Redirect("mis_negocios.aspx");
            }
        }
    }
}