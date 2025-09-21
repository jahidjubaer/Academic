import { useState } from "react";
import Product from "../components/Product";
import { initMongoose } from "../lib/mongoose";
import { findAllProducts } from "./api/products";
import Layout from "../components/Layout";

export default function Home({ products }) {
  // State for search input
  const [phrase, setPhrase] = useState("");

  // Extract unique category names from products
  const categoriesNames = Array.from(new Set(products.map((product) => product.category)));

  // Filter products based on search phrase
  const filteredProducts = phrase
    ? products.filter((product) =>
        product.name.toLowerCase().includes(phrase.toLowerCase())
      )
    : products;

  return (
    <Layout>
      {/* Header Section */}
      <header className="text-center py-8 bg-white text-black">
        <h1 className="text-4xl font-bold">Jahid Worlds</h1>
        <p className="text-lg mt-2">Explore a world of amazing products</p>
      </header>

      {/* Main Content */}
      <main className="p-4">
        {/* Search Input */}
        <input
          value={phrase}
          onChange={(e) => setPhrase(e.target.value)}
          type="text"
          placeholder="Search for products..."
          className="bg-gray-200 w-full py-2 px-4 rounded-xl mb-6"
        />

        {/* Heading Before Products */}
        <h2 className="text-2xl font-semibold text-center mt-2 mb-0">
          Choose Your Product
        </h2>

        {/* Display Products by Category */}
        <div>
          {categoriesNames.map((categoryName) => (
            <div key={categoryName} className="mb-10">
              {/* Category Header */}
              <h2 className="text-3xl font-semibold py-5 capitalize border-b border-gray-300">
                {categoryName}
              </h2>

              {/* Products Grid */}
              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 mt-8 justify-items-center">
                {filteredProducts
                  .filter((product) => product.category === categoryName)
                  .map((productInfo) => (
                    <div
                      key={productInfo._id}
                      className="flex justify-center w-80"
                    >
                      <Product {...productInfo} />
                    </div>
                  ))}
              </div>
            </div>
          ))}
        </div>
      </main>
    </Layout>
  );
}

// Fetch products from the database
export async function getServerSideProps() {
  await initMongoose();
  const products = await findAllProducts();
  return {
    props: {
      products: JSON.parse(JSON.stringify(products)), // Serialize data for Next.js
    },
  };
}
