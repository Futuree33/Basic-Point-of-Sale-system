import {useContext, useState} from 'react';
import {OrderContext} from "@/Context/OrderContext.jsx";
import {FinishOrderModal} from "@/Components/Modals/FinishOrderModal.jsx";

export default function CurrentOrder() {

    const { state, removeOrder, clearOrders, getOrderTotal } = useContext(OrderContext);
    const [showFinishModal, setShowFinishModal] = useState(false);

    return (
        <>
            <FinishOrderModal clearOrders={clearOrders} show={showFinishModal} setShow={setShowFinishModal}  price={getOrderTotal()} orders={state.orders} />

            <h1 className="text-center font-medium">
                Current Order
            </h1>

            <div className="mt-4 h-[250px]  noscrollbar overflow-y-scroll">
                {state.orders.map((order, key) => (
                    <div key={key} className="flex items-center justify-between">
                        <h1>{order.name}</h1>
                        <button
                            className="text-red-500"
                            onClick={() => removeOrder(key)}
                        >
                            Remove
                        </button>
                    </div>
                ))}
            </div>

            <h1 className="mt-3 font-medium">
                Order Total: €{getOrderTotal()}
            </h1>

            <button
                onClick={() => setShowFinishModal(true)}
                className="border-2 border-black w-full py-2 mt-4"
            >
                Finish Order
            </button>
        </>
    );
}