import {OrderContext} from "@/Context/OrderContext.jsx";
import {useReducer} from "react";
import {ActionTypes, Reducer} from "@/Context/Reducer.js";

export default function OrderContextProvider({ children }) {

    const [state, dispatch] = useReducer(Reducer, {
        orders: [],
    })

    const addOrder = (order) => {
        dispatch({ type: ActionTypes.ADD_ORDER, payload: order });
    }

    const removeOrder = (index) => {
        dispatch({ type: ActionTypes.REMOVE_ORDER, payload: { index } });
    }

    const clearOrders = (index) => {
        dispatch({ type: ActionTypes.CLEAR_ORDERS });
    }

    const getOrderTotal = () => {
        return state.orders.reduce((total, order) => total + order.price, 0);
    };

    return (
        <OrderContext.Provider value={{ state, addOrder, removeOrder, clearOrders, getOrderTotal }}>
            {children}
        </OrderContext.Provider>
    )
}