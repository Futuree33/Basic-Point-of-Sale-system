export const ActionTypes = {
    ADD_ORDER: 'ADD_ORDER',
    REMOVE_ORDER: 'REMOVE_ORDER',
    CLEAR_ORDERS: 'CLEAR_ORDERS',
}

export const Reducer = (state, action) => {
    switch (action.type) {
        case ActionTypes.ADD_ORDER:
            return {
                ...state,
                orders: [...state.orders, action.payload],
            };
        case ActionTypes.REMOVE_ORDER:
            return {
                ...state,
                orders: state.orders.filter((_, index) => index !== action.payload.index),
            };
        case ActionTypes.CLEAR_ORDERS:
            return {
                ...state,
                orders: [],
            };
        default:
            return state;
    }
}