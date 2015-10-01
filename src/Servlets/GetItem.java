package Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BusinessLogic.Item;
import BusinessLogic.ItemHandler;

//@WebServlet("/GetItem")
public class GetItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetItem() {
        super();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		int itemId = Integer.parseInt(request.getParameter("itemId"));
 		Item item = ItemHandler.getItem(itemId);
 		request.setAttribute("item", item);
 		request.getRequestDispatcher("/Pages/ItemEditor.jsp").forward(request, response);
	}
}
