import {useContext, useState} from "react";
import {OrderContext} from "@/Context/OrderContext.jsx";

export default function Index({categories, products}) {

    const {addOrder} = useContext(OrderContext);

    return (
        <div className="p-5 grid gap-5">
            {categories.map((category, index) =>
                <div key={index}>
                    <h1 className="font-semibold text-[20px]">
                        {category.name} <span className="font-normal text-[15px]">- All Items</span>
                    </h1>

                    <div className="mt-3 flex gap-3">
                        {products
                            .filter(product => product.category === category.name)
                            .map((product) => (
                                <button
                                    key={index}
                                    onTouchStart={() => {
                                    }}
                                    onClick={() => addOrder(product)}
                                    className="border-2 px-5 py-2 border-black transition active:bg-black/20"
                                >
                                    {product.name}
                                </button>
                            ))
                        }
                    </div>
                </div>
            )}
        </div>
    )
}