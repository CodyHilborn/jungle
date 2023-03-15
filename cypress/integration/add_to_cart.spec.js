describe("add to cart", () => {
	beforeEach(() => {
		cy.visit("localhost:3000/");
	});

	it("Confirms there are 12 products on the page", () => {
		cy.get(".products article").should("have.length", 12);
	});

	it("Confirms that the cart count increases by 1 when 'Add to Cart' is clicked", () => {
		cy.get(".navbar").contains("My Cart (0)");
		cy.get("button").contains("Add").click({ force: true });
		cy.get(".navbar").contains("My Cart (1)");
	});
});
