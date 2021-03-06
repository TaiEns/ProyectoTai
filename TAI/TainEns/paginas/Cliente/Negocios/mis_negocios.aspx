﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mis_negocios.aspx.cs" Inherits="TainEns.paginas.Cliente.Negocios.mis_negocios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous"/>
    <link rel="stylesheet" type="text/css" href="../../../css/style.css"/>
    <link rel="stylesheet" type="text/css" href="../../../css/floating-labels.css"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous"/>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <title>Mis Negocios</title>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light azuloscuro">
	  <a class="navbar-brand text-white" href="#"><img src="../../../img/footer.png" width="30" height="30"/>TAI</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>

	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item active">
	        <a class="nav-link text-white" href="../cliente.aspx">Inicio <span class="sr-only">(current)</span></a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link text-white active" href="#">Mis Negocios</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link text-white active" href="../Listas/listas.aspx">Lista</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link text-white active" href="../Productos/categorias_productos.aspx">Productos</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link text-white active" href="buscar_negocio.aspx">Negocios</a>
	      </li>
	    </ul>

	    <form class="form-inline my-2 my-lg-0">
	      <div class="dropdown ">
			  <button class="btn btn-secondary dropdown-toggle azuloscuro usuario" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    <img src="../../../img/usuario.png" width="30" height="30"/>
			  </button>
			  <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenu2">
			    <button class="dropdown-item" type="button">Configuración <i class="fas fa-edit"></i></button>
                <a class="dropdown-item" href="../../../index.aspx">Cerrar Sesión <i class="fas fa-sign-out-alt"></i></a>
			  </div>
			</div>
	    </form>
	  </div>
	</nav>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <h1>Mis Negocios</h1>
                <div class="form-inline" style="float: right;">
                    <asp:HyperLink ID="hlRegistrarse" class="btn btn-outline-primary" runat="server" NavigateUrl="~/paginas/Cliente/Negocios/agregar_negocio.aspx">Agregar</asp:HyperLink>
                </div>
            </div>  
            <!--<div class="row">
                <div id="tarjeta" class="columna shadow-lg p-3 mb-5 bg-white rounded" runat="server">
                    <div class="col-md-auto">
                        <div class="card" style="width: 18rem;">
                          <div class="card-body">
                            <h5 id="TituloTarjeta" class="card-title" runat="server">Card title</h5>
                              <asp:Label ID="lblDescripcion" runat="server" Text="" class="card-text"></asp:Label>
                              <asp:Button ID="btnModificar" runat="server" Text="Modificar" class="btn btn-primary" />
                              <asp:Button ID="btnBorrar" runat="server" Text="Borrar" class="btn btn-primary cancelar" />
                          </div>
                        </div>
                    </div>
                </div>
                <div class="columna shadow-lg p-3 mb-5 bg-white rounded">
                    <div class="col-md-auto">
                        <div class="card" style="width: 18rem;">
                          <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <asp:Button ID="Button1" runat="server" Text="Modificar" class="btn btn-primary" />
                            <asp:Button ID="Button2" runat="server" Text="Borrar" class="btn btn-primary cancelar" />
                          </div>
                        </div>
                    </div>
                </div>
            </div>-->
        </div>
        <asp:GridView ID="GridView1" runat="server"
         OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
            OnRowDeleting="GridView1_RowDeleting"
            OnRowEditing="GridView1_RowEditing"
            AutoGenerateColumns="False" DataKeyNames="IdNegocios" CssClass="table table-hover"
            OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:BoundField DataField="NombreNegocio" HeaderText="Nombre" />
                <asp:ButtonField ButtonType="Button" CommandName="productos" HeaderText="Productos" Text="Productos" />
                <asp:ButtonField ButtonType="Button" CommandName="modificar" HeaderText="Modificar" Text="Modificar" />
                <asp:ButtonField ButtonType="Button" CommandName="eliminar" HeaderText="Eliminar" Text="Eliminar" />
                
            </Columns>
 
            <HeaderStyle CssClass="thead-dark" />
 
        </asp:GridView>

        <!-- Modal -->
        <asp:Panel ID="pELiminar" runat="server"  class="card form-signin" style="width: 25rem;">
            <div class="card-body">
                <h5 class="card-title"><asp:Label runat="server" ID="lblCardTitle" Text="Seguro"></asp:Label></h5>
                <div class="text-center">
                    <p>¿Seguro que quieres eliminar este producto de tu negocio?</p>
                </div>
                <asp:Button ID="btnSi" runat="server" Text="Si" class="btn btn-primary" OnClick="btnSi_Click" />
                <asp:Button ID="btnNo" runat="server" Text="No" class="btn btn-primary cancelar" OnClick="btnNo_Click" />
            </div>
        </asp:Panel>

        <asp:Panel ID="pELiminarConf" runat="server"  class="card form-signin" style="width: 25rem;">
            <div class="card-body">
                <h5 class="card-title"><asp:Label runat="server" ID="Label1" Text="Seguro"></asp:Label></h5>
                <div class="text-center">
                    <p>¿Realmente Seguro que quieres eliminar este producto de tu negocio?, No habrá otra oportunidad</p>
                </div>
                <asp:Button ID="Button3" runat="server" Text="Si" class="btn btn-primary" OnClick="btnSiC_Click" />
                <asp:Button ID="Button4" runat="server" Text="No" class="btn btn-primary cancelar" OnClick="btnNoC_Click" />
            </div>
        </asp:Panel>
    </form>

    <footer class="footer azuloscuro">
    	<div class="footer-content">
      		<img src="../../../img/footer.png" width="50" height="50" id="Icono-footer"/><p>TAI</p>
      		<div id="redes">
        		<div id="enlaces-redes">
          			<a href="#"><img src="../../../img/facebook-logo.png" width="30" height="30"/></a>
          			<a href="#"><img src="../../../img/instagram-logo.png" width="30" height="30"/></a>
          			<a href="#"><img src="../../../img/gmail-logo.png" width="30" height="30"/></a>
        		</div>
      		</div>
    	</div>
  </footer>

  <script type="text/javascript" src="../../../js/bootstrap.min.js"></script>
  <script type="text/javascript" src="../../../js/bootstrap.bundle.js"></script>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

</body>
</html>
