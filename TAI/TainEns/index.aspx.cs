﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Entidades;
using Negocios;

namespace TainEns
{
    public partial class index : System.Web.UI.Page
    {
        E_Usuario ObjEU = new E_Usuario();
        N_Usuario ObjNU = new N_Usuario();
        E_Rol ObjER = new E_Rol();
        N_Rol ObjNR = new N_Rol();
        E_UsuarioRol ObjEUR = new E_UsuarioRol();
        N_UsuarioRol ObjNUR = new N_UsuarioRol();
        int intentos;//si lo pongo aqui siempre lo actualiza a 3
        protected void Page_Load(object sender, EventArgs e)
        {
            intentos = 3;//si lo pongo aqui siempre se actualiza a 3
            if (!IsPostBack)
            {
                Session["Intentos"] = 3;
                // intentos = 3;/// si lo pongo aqui no hace nada
                Inicio();
            }
        }

        protected void Inicio()
        {
            intentos = 3;/// si lo pongo aqui no hace nada
            ApagarComponentes();
        }

        #region Metodos
        protected void ApagarComponentes()
        {
            pnErrorUsuarioContra.Visible = false;
        }

        protected void Direccionar(E_Usuario ObjEU)
        {
            ObjEUR = ObjNUR.BuscarUsuarioRolPorId(ObjEU.IdUsuarios);
            Session["IdUsuario"] = ObjEU.IdUsuarios;
            if (ObjEUR.IdRol == 1)
            {
                Response.Redirect("paginas/Administrador/administrador.aspx");
            }
            if (ObjEUR.IdRol == 2)
            {
                Response.Redirect("paginas/Cliente/cliente.aspx");
            }
            if (ObjEUR.IdRol == 3)
            {
                //Cliente
            }
        }
        #endregion

        #region Botones
        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            Response.Redirect("paginas/registrar_usuario.aspx");
        }

        protected void IniciarSesion_Click(object sender, EventArgs e)
        {
            intentos = Convert.ToInt16(Session["Intentos"]);
            ObjEU = ObjNU.BuscarUsuarioPorUsuario(Usuario.Text);
            if (ObjEU != null)
            {
                if (intentos > 0)
                {
                    if (ObjEU.PasswordUsuario == Contrasena.Text)
                    {
                        intentos = 3;
                        Direccionar(ObjEU);
                    }
                    else
                    {
                        pnErrorUsuarioContra.Visible = true;

                        switch (intentos)
                        {
                            case 3:
                                {
                                    Label1.Text = "quedan 2 intentos";
                                    Session["Intentos"] = 2;
                                    intentos = 2;
                                    break;
                                }
                            case 2:
                                {
                                    Label1.Text = "quedan 1 intentos";
                                    Session["Intentos"] = 1;
                                    intentos = 1;
                                    break;
                                }
                            case 1:
                                {
                                    Label1.Text = "quedan 0 intentos";
                                    Session["Intentos"] = 0;
                                    intentos = 0;
                                    break;
                                }
                            case 0:
                                {
                                    Label1.Text = "espera 5 minutos";
                                    break;
                                }
                        }
                    }
                }
                else
                {
                    Label1.Text = "no quedan intentos";
                }
            }
            else
            {
                pnErrorUsuarioContra.Visible = true;
            }
        }
        #endregion
    }
}