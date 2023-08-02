using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Calculadora.Pages
{
    public partial class Index : Page
    {
        private static string operacion;
        readonly SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                CargarTabla();
            }
        }

        [WebMethod]
        public static void GetOperacion(string OperacionJson)
        {
            // Deserialize the JSON data into OperacionData object
            var serializer = new JavaScriptSerializer();
            OperacionData data = serializer.Deserialize<OperacionData>(OperacionJson);

            // Get the operation from the deserialized object and assign it to the static variable
            operacion = data.OperacionJson;
            Debug.WriteLine("Esta es la operacion: " + operacion);
        }

        // Clase para representar el objeto JSON recibido desde el cliente
        public class OperacionData
        {
            public string OperacionJson { get; set; }
        }

        protected void BtnEnter_Click(object sender, EventArgs e)
        {
            Debug.WriteLine("Entrando a EnterClick");
            SqlCommand cmd = new SqlCommand("ib_create", conn);
            conn.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Operacion", SqlDbType.VarChar).Value = operacion;
            cmd.Parameters.Add("@Resultado", SqlDbType.VarChar).Value = input_number.Text;
            cmd.ExecuteNonQuery();
            conn.Close();
            CargarTabla();
        }

        void CargarTabla()
        {
            SqlCommand cmd = new SqlCommand("ib_load", conn);
            conn.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            OperationsGridView.DataSource = dt;
            OperationsGridView.DataBind();
            conn.Close();
        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            Button BtnDelete = (Button)sender;
            GridViewRow selectdrwo = (GridViewRow)BtnDelete.NamingContainer;
            string id = selectdrwo.Cells[1].Text;
            SqlCommand cmd = new SqlCommand("ib_delete", conn);
            conn.Open();
            cmd.CommandType= CommandType.StoredProcedure;
            cmd.Parameters.Add("@Id", SqlDbType.Int).Value = id;
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("Index.aspx");
        }
    }
}