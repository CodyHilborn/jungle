describe("home page", () => {
	beforeEach(() => {
		cy.visit("localhost:3000/");
	});

	it("Confirms there are 12 products on the page", () => {
		cy.get(".products article").should("have.length", 12);
	});

	it("Takes you to product details page when you click on the article", () => {
		cy.get('[alt="Cliff Collard"]').click();
		cy.get(".product-detail").should("be.visible");
	});
});
