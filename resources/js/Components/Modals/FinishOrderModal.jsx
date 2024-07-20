import {AnimatePresence, motion} from "framer-motion";
import {useEffect, useState} from "react";
import axios from "axios";

export function FinishOrderModal({show, setShow, price, orders, clearOrders}) {

    const [paymentType, setPaymentType] = useState(null);
    const [cashGiven, setCashGiven] = useState(0);
    const [orderFinished, setOrderFinished] = useState(false);

    const completeOrder = () => {
        axios.post("/api/order/finish", {
            order: orders,
            type: paymentType,
            amount: price
        })
            .then(() => {
                setPaymentType(null)
                setOrderFinished("Success")
            })
            .catch(() => {
                setPaymentType(null)
                setOrderFinished("Failed")
            })

        clearOrders()
    }

    useEffect(() => setOrderFinished(false), [show])

    return (
        <>
            <AnimatePresence mode="wait">
                {show &&
                    <motion.div
                        inital={{opacity: 0}}
                        animate={{opacity: 1}}
                        exit={{opacity: 0}}
                        onClick={(e) => setShow(e.target !== e.currentTarget)}
                        className="fixed left-0 opacity-0 top-0 w-full h-full flex items-center justify-center bg-black/20"
                    >

                        <div className="w-[400px] -h-[200px] bg-[#0f0f0f] p-5 grid gap-3">
                            {orderFinished &&
                                <h1>
                                    {orderFinished}
                                </h1>
                            }

                            {!orderFinished &&
                                <>
                                    <div className="flex  gap-2">
                                        <button
                                            onClick={() => setPaymentType(0)}
                                            style={{backgroundColor: paymentType === 0 ? "black" : ""}}
                                            className="border-2 border-black w-full py-2 "
                                        >
                                            Card Payment
                                        </button>

                                        <button
                                            onClick={() => setPaymentType(1)}
                                            style={{backgroundColor: paymentType === 1 ? "black" : ""}}
                                            className="border-2 border-black w-full py-2 "
                                        >
                                            Cash Payment
                                        </button>
                                    </div>

                                    {paymentType === 1 &&
                                        <>
                                            <input
                                                value={cashGiven}
                                                onInput={(e) => setCashGiven(e.target.value)}
                                                type="number"
                                                min="0"
                                                step="any"
                                                className="border-2 bg-black border-black w-full p-2"
                                                placeholder="Cash Given"
                                            />

                                            <h1 className="font-medium text-[17px]">
                                                Change Owed: {cashGiven - price}
                                            </h1>
                                        </>
                                    }

                                    {paymentType !== null &&
                                        <button
                                            onClick={completeOrder}
                                            className="border-2 border-black w-full py-2"
                                        >
                                            Complete
                                        </button>
                                    }
                                </>
                            }
                        </div>
                    </motion.div>
                }
            </AnimatePresence>
        </>
    )
}
