import CurrentOrder from '@/Components/Sidebar/CurrentOrder.jsx';
import OrderContextProvider from "@/Components/OrderContextProvider.jsx";
import {AnimatePresence} from "framer-motion";
import {Link} from "@inertiajs/react";

export default function Layout({ children }) {

    return (
        <OrderContextProvider>
            <div className="flex h-full">
                <div className="w-[300px] flex flex-col border-r-2 px-5">
                    <h1 className="text-center py-5 font-bold text-[20px]">
                        The Pigeon Box
                    </h1>

                    <CurrentOrder/>

                    <div className="mt-10 grid gap-2">
                        <Link className="font-medium text-[20px]" href="/">
                            Home
                        </Link>
                        <Link className="font-medium text-[20px]" href="/payments">
                            Payments
                        </Link>
                    </div>

                </div>
                <div className="w-full gap-3 overflow-y-scroll">
                    {children}
                </div>
            </div>
        </OrderContextProvider>
    );
}