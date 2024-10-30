package DAO;

import model.CartItem;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {

    public void addToCart(HttpSession session, String productId, int quantity) {
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }

        boolean itemExists = false;
        for (CartItem item : cart) {
            if (item.getProductId().equals(productId)) {
                item.setQuantity(item.getQuantity() + quantity);
                itemExists = true;
                break;
            }
        }

        if (!itemExists) {
            CartItem newItem = new CartItem(productId, quantity);
            cart.add(newItem);
        }

        session.setAttribute("cart", cart);
    }

    public void removeFromCart(HttpSession session, String productId) {
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart != null) {
            for (int i = 0; i < cart.size(); i++) {
                if (cart.get(i).getProductId().equals(productId)) {
                    cart.remove(i);
                    break;
                }
            }
            session.setAttribute("cart", cart);
        }
    }
}
