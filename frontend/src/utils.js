import emojilib from "emojilib";

const shortnameToEmojiMap = new Map();

for (const emoji in emojilib) {
	shortnameToEmojiMap.set(emojilib[emoji][0], emoji);
}

export const shortnameToEmoji = (shortname) =>
	shortnameToEmojiMap.get(shortname);

export const urlToJson = async (url) => await (await fetch(url)).json();
