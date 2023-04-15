const { Router } = require("express");
const router = Router();

const {
	sendMessage,
	getMessages,
	addItem,
	deleteItem,
	getStores,
	getItemsOfStore,
	writeReview,
	getReviews,
	addFavourite,
} = require("../controllers/actions.controller");

router.post("/sendMessage", sendMessage);
router.post("/getMessages", getMessages);
router.post("/addItem", addItem);
router.delete("/deleteItem", deleteItem);
router.get("/getStores", getStores);
router.post("/getItemsOfStore", getItemsOfStore);
router.post("/writeReview", writeReview);
router.post("/getReviews", getReviews);
router.post("/addFavourite", addFavourite);

module.exports = router;
