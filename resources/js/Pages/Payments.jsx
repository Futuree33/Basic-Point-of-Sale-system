import {useState} from "react";

export default function Payments({today, payments, earnedToday, earned}) {

    return (
        <div className="p-5 grid gap-3">
            <h1 className="text-[20px] font-medium">
                Today
            </h1>

            <h1 className="text-[17px] font-medium">
                Todays Total: €{earnedToday}
            </h1>

            {today.map((payment, key) =>
                <div className="border-2 p-2 " key={key}>
                    <h1>
                        #{payment.id} &nbsp; Created On {new Date(payment.created_at).toLocaleString()}
                    </h1>

                    <div className="mt-2">
                        {JSON.parse(payment.order).map((item, key) =>
                            <div key={key} className="flex gap-10">
                                <h1>
                                    {item.name}
                                </h1>

                                <h1>
                                    €{item.price}
                                </h1>
                            </div>
                        )}
                    </div>

                    <div className="mt-2">
                        Order Total: €{payment.price}
                    </div>
                </div>
            )}

            <h1 className="text-[20px] font-medium">
                All Time
            </h1>

            <h1 className="text-[17px] font-medium">
                All Time Total: €{earned}
            </h1>

            {payments.map((payment, key) =>
                <div className="border-2 p-2 " key={key}>
                    <h1>
                        Created On {new Date(payment.created_at).toLocaleString()}
                    </h1>

                    <div className="mt-2">
                        {JSON.parse(payment.order).map((item, key) =>
                            <div key={key} className="flex gap-10">
                                <h1>
                                    {item.name}
                                </h1>

                                <h1>
                                    €{item.price}
                                </h1>
                            </div>
                        )}
                    </div>

                    <div className="mt-2">
                        Order Total: €{payment.price}
                    </div>
                </div>
            )}
        </div>
    )
}