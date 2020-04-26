<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs"
    Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CIS 2222 | Jeremy L. Shepherd</title>
    <link rel="stylesheet" href="Content/bootstrap.flatly.css" />
</head>
<body>

    <%-- script is used for javascript --%>

    <form id="form1" runat="server">
        <div class="container">
            <h1>Lab #05 | Jeremy L. Shepherd</h1>
            <asp:SqlDataSource ID="InventorySource"
                SelectCommand="SELECT [InventoryId], [SupplierId], [Item], [UnitsInStock] FROM [Inventory]"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                runat="server" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Inventory] WHERE [InventoryId] = @original_InventoryId AND (([SupplierId] = @original_SupplierId) OR ([SupplierId] IS NULL AND @original_SupplierId IS NULL)) AND [Item] = @original_Item AND [UnitsInStock] = @original_UnitsInStock"
                InsertCommand="INSERT INTO [Inventory] ([InventoryId], [SupplierId], [Item], [UnitsInStock]) VALUES (@InventoryId, @SupplierId, @Item, @UnitsInStock)"
                OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Inventory] SET [SupplierId] = @SupplierId, [Item] = @Item, [UnitsInStock] = @UnitsInStock WHERE [InventoryId] = @original_InventoryId AND (([SupplierId] = @original_SupplierId) OR ([SupplierId] IS NULL AND @original_SupplierId IS NULL)) AND [Item] = @original_Item AND [UnitsInStock] = @original_UnitsInStock">
                <DeleteParameters>
                    <asp:Parameter Name="original_InventoryId" Type="Int32" />
                    <asp:Parameter Name="original_SupplierId" Type="Int32" />
                    <asp:Parameter Name="original_Item" Type="String" />
                    <asp:Parameter Name="original_UnitsInStock" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="InventoryId" Type="Int32" />
                    <asp:Parameter Name="SupplierId" Type="Int32" />
                    <asp:Parameter Name="Item" Type="String" />
                    <asp:Parameter Name="UnitsInStock" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="SupplierId" Type="Int32" />
                    <asp:Parameter Name="Item" Type="String" />
                    <asp:Parameter Name="UnitsInStock" Type="Int32" />
                    <asp:Parameter Name="original_InventoryId" Type="Int32" />
                    <asp:Parameter Name="original_SupplierId" Type="Int32" />
                    <asp:Parameter Name="original_Item" Type="String" />
                    <asp:Parameter Name="original_UnitsInStock" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <h3>Inventory View</h3>
            <asp:GridView 
                ID="InventoryGridView" 
                DataSourceID="InventorySource"
                AutoGenerateColumns="False" 
                runat="server"
                AllowSorting="True"
                DataKeyNames="InventoryId" 
                CssClass="table table-dark table-bordered">
                <Columns>
                    <asp:BoundField 
                        DataField="InventoryId" 
                        HeaderText="InventoryId"
                        ReadOnly="True" 
                        SortExpression="InventoryId" />
                    <asp:BoundField 
                        DataField="SupplierId" 
                        HeaderText="SupplierId"
                        SortExpression="SupplierId" />
                    <asp:BoundField 
                        DataField="Item" 
                        HeaderText="Item"
                        SortExpression="Item" />
                    <asp:BoundField 
                        DataField="UnitsInStock" 
                        HeaderText="UnitsInStock"
                        SortExpression="UnitsInStock" />
                </Columns>
                <EmptyDataTemplate>
                    <h1>No items need to be re-ordered</h1>
                </EmptyDataTemplate>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT * FROM [Suppliers]" ConflictDetection="CompareAllValues"
                DeleteCommand="DELETE FROM [Suppliers] WHERE [SupplierId] = @original_SupplierId AND [CompanyName] = @original_CompanyName AND [Country] = @original_Country AND [ContactName] = @original_ContactName"
                InsertCommand="INSERT INTO [Suppliers] ([SupplierId], [CompanyName], [Country], [ContactName]) VALUES (@SupplierId, @CompanyName, @Country, @ContactName)"
                OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Suppliers] SET [CompanyName] = @CompanyName, [Country] = @Country, [ContactName] = @ContactName WHERE [SupplierId] = @original_SupplierId AND [CompanyName] = @original_CompanyName AND [Country] = @original_Country AND [ContactName] = @original_ContactName">
                <DeleteParameters>
                    <asp:Parameter Name="original_SupplierId" Type="Int32" />
                    <asp:Parameter Name="original_CompanyName" Type="String" />
                    <asp:Parameter Name="original_Country" Type="String" />
                    <asp:Parameter Name="original_ContactName" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="SupplierId" Type="Int32" />
                    <asp:Parameter Name="CompanyName" Type="String" />
                    <asp:Parameter Name="Country" Type="String" />
                    <asp:Parameter Name="ContactName" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CompanyName" Type="String" />
                    <asp:Parameter Name="Country" Type="String" />
                    <asp:Parameter Name="ContactName" Type="String" />
                    <asp:Parameter Name="original_SupplierId" Type="Int32" />
                    <asp:Parameter Name="original_CompanyName" Type="String" />
                    <asp:Parameter Name="original_Country" Type="String" />
                    <asp:Parameter Name="original_ContactName" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>            

            <h3>Suppliers View</h3>
            <asp:GridView 
                ID="GridView1" 
                runat="server" 
                AllowSorting="True"
                AutoGenerateColumns="False" 
                DataKeyNames="SupplierId" 
                DataSourceID="SqlDataSource1"
                CssClass="table table-dark table-bordered">
                <Columns>
                    <asp:BoundField 
                        DataField="SupplierId" 
                        HeaderText="SupplierId"
                        ReadOnly="True" 
                        SortExpression="SupplierId" />
                    <asp:BoundField 
                        DataField="CompanyName" 
                        HeaderText="CompanyName"
                        SortExpression="CompanyName" />
                    <asp:BoundField 
                        DataField="Country" 
                        HeaderText="Country" 
                        SortExpression="Country" />
                    <asp:BoundField 
                        DataField="ContactName" 
                        HeaderText="ContactName"
                        SortExpression="ContactName" />
                </Columns>
                <EmptyDataTemplate>
                    <h1>No items need to be re-ordered</h1>
                </EmptyDataTemplate>
            </asp:GridView>           

            <h3>Re-ordered List</h3>     
            <div class="form-inline">
                <div class="form-group">
                    <asp:Label Text="Quantity" CssClass="col-form-label" runat="server"/>
                    <asp:TextBox ID="QtyInput" runat="server" CssClass="form-control" placeholder="Enter a number"></asp:TextBox>
                    <asp:Button ID="QtyButton" Text="Get Reordered List" runat="server" CssClass="btn btn-primary"/>
                    <asp:RequiredFieldValidator 
                        ControlToValidate="QtyInput" 
                        runat="server"
                        ErrorMessage="Value required" 
                        ForeColor="DarkRed">
                    </asp:RequiredFieldValidator>
                    <asp:CustomValidator 
                        ControlToValidate="QtyInput"
                        ClientValidationFunction="ClientValidate"
                        runat="server"
                        OnServerValidate="ServerValidation"
                        ErrorMessage="Please enter a valid value (a whole number)"
                        ForeColor="DarkRed">
                    </asp:CustomValidator>                    
                </div>
            </div>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Suppliers.CompanyName AS [Supplier Name], Inventory.UnitsInStock AS Quantity, Inventory.Item AS [Product Name] FROM Inventory INNER JOIN Suppliers ON Inventory.SupplierId = Suppliers.SupplierId WHERE (Inventory.UnitsInStock &lt;= @quantity)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="QtyInput" DefaultValue="0" Type="Int32" Name="quantity" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2"  CssClass="table table-dark table-bordered">
                <Columns>
                    <asp:BoundField DataField="Supplier Name" HeaderText="Supplier Name" SortExpression="Supplier Name" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                    <asp:BoundField DataField="Product Name" HeaderText="Product Name" SortExpression="Product Name" />
                </Columns>
                 <EmptyDataTemplate>
                    <h1>No items need to be re-ordered</h1>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
    </form>
</body>
</html>

<script language="javascript"> 
    function ClientValidate(source, arguments) {
        console.log(arguments.Value);
        let str = `${arguments.Value}`;
        //Checked for valid number and checked string representation of Value for decimal to validate
        if (!isNaN(arguments.Value) && str.indexOf('.') == -1) {
            arguments.IsValid = true;
        } else {
            arguments.IsValid = false;
        }
    }
</script>